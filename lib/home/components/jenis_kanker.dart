import 'package:derma_scan/const.dart';
import 'package:flutter/material.dart';

class JenisKanker extends StatelessWidget {
  final String images;
  final String type;
  const JenisKanker({required this.images, required this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 3),
      child: Column(
        children: [
          Container(
            height: 130,
            width: 180,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(images), fit: BoxFit.cover),
            ),
          ),
          Container(
            height: 50,
            width: 180,
            color: kTextColor,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  type,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: kBackgroundColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
