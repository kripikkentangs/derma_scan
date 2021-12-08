import 'package:flutter/material.dart';

class BodyScan extends StatefulWidget {
  const BodyScan({Key? key}) : super(key: key);

  @override
  _BodyScanState createState() => _BodyScanState();
}

class _BodyScanState extends State<BodyScan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    return AspectRatio(
      aspectRatio: 1,
      child: Image.asset(
        "assets/images/placeholder.jpg",
        fit: BoxFit.fill,
      ),
    );
  }

  getResult() {
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

  // getConfident() {}
}
