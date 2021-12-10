import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import 'package:tflite/tflite.dart';

class BodyScan extends StatefulWidget {
  const BodyScan({Key? key}) : super(key: key);

  @override
  _BodyScanState createState() => _BodyScanState();
}

class _BodyScanState extends State<BodyScan> {

  bool _loading = true;
  File? _image;
  List? _output;
  final picker = ImagePicker();


  pickCameraImage() async {
    var image = await picker.getImage(source: ImageSource.camera);

    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image!);
  }

  pickGalleryImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);

    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image!);
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5);

    setState(() {
      _loading = false;
      _output = output;
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
                // getConfident(),
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
            child: Image.file(_image!),
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
                'It\'s ${_output![0]['label']}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 20,
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
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
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
          onPressed: () => pickCameraImage(),
        ),
        SpeedDialChild(
          child: const Icon(Icons.add_photo_alternate),
          foregroundColor: Colors.white,
          backgroundColor: Colors.grey[850],
          label: 'Gallery',
          onPressed: () => pickGalleryImage(),
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
