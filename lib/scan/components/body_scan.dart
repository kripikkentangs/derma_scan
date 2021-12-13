import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import 'package:tflite/tflite.dart';
import '../../const.dart';

class BodyScan extends StatefulWidget {
  const BodyScan({Key? key}) : super(key: key);

  @override
  _BodyScanState createState() => _BodyScanState();
}

class _BodyScanState extends State<BodyScan> {
  bool _loading = true;
  File? _image;
  List? _output;
  String? _confidenceStr;
  final picker = ImagePicker();

  Future getImages(ImageSource source) async {
    setState(() {
      _loading = true;
    });

    var image = await picker.getImage(
      source: source,
      maxWidth: 1920,
      maxHeight: 1920,
    );

    if (image != null) {
      File? croppedImage = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          compressQuality: 75,
          maxWidth: 720,
          maxHeight: 720,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            lockAspectRatio: true,
            toolbarColor: kBackgroundColor,
            toolbarTitle: "Crop The Image",
            toolbarWidgetColor: kTextColor,
            statusBarColor: kBackgroundColor,
            backgroundColor: kStatusBarColor,
            cropGridColor: Colors.white38,
            cropFrameColor: Colors.white,
            hideBottomControls: true,
          ));
      classifyImage(croppedImage!);

      setState(() {
        _image = croppedImage;
        _loading = false;
      });
    } else {
      setState(() {
        _loading = false;
      });
    }
  }

  Future classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5);

    setState(() {
      _loading = false;
      _output = output;

      _confidenceStr =
          (_output![0]['confidence'] * 100).toStringAsFixed(0) + "%";
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/models/modelres.tflite',
      labels: 'assets/models/labels.txt',
    );
  }

  @override
  void initState() {
    super.initState();
    _loading = true;
    loadModel().then((value) {});
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buildSpeedDials(),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                getImage(),
                getResult(),
                getConfidence(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getImage() {
    if (_loading) {
      return AspectRatio(
        aspectRatio: 1,
        child: Image.asset(
          "assets/images/placeholder.jpg",
          fit: BoxFit.fill,
        ),
      );
    } else {
      return Container(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.file(_image!, fit: BoxFit.cover),
            ),
          ],
        ),
      );
    }
  }

  getResult() {
    if (_output != null) {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            color: Colors.blue[900],
            child: SizedBox(
              height: 40,
              width: 350,
              child: Center(
                child: Text(
                  'Classification Result',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Container(
            color: Color(0xFF878787),
            child: SizedBox(
              height: 100,
              width: 350,
              child: Center(
                child: Text(
                  '${_output![0]['label']}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Container(),
        ],
      );
    }
  }

  getConfidence() {
    if (_output != null) {
      return Column(
        children: [
          Container(
            color: Colors.blue[900],
            margin: EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 40,
              width: 350,
              child: Center(
                child: Text(
                  'Accuracy',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            color: Colors.grey[700],
            child: SizedBox(
              height: 100,
              width: 350,
              child: Center(
                child: Text(
                  _confidenceStr!,
                  // '${_output![0]['confidence'].toString()}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Center(
              child: Text(
                'No Image Detected',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kTextColor,
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      );
    }
  }

  SpeedDial buildSpeedDials() {
    return SpeedDial(
      child: const Icon(Icons.add),
      speedDialChildren: <SpeedDialChild>[
        SpeedDialChild(
          child: const Icon(Icons.add_a_photo),
          foregroundColor: Colors.white,
          backgroundColor: Colors.grey[850],
          label: 'Camera',
          onPressed: () => getImages(ImageSource.camera),
        ),
        SpeedDialChild(
          child: const Icon(Icons.add_photo_alternate),
          foregroundColor: Colors.white,
          backgroundColor: Colors.grey[850],
          label: 'Gallery',
          onPressed: () => getImages(ImageSource.gallery),
        )
      ],
      closedForegroundColor: Colors.white,
      closedBackgroundColor: Colors.grey[850],
      openForegroundColor: Colors.grey[850],
      openBackgroundColor: Colors.white,
    );
  }

  // getConfident() {}
}
