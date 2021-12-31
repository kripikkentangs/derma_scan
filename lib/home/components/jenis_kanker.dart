import 'package:derma_scan/const.dart';
import 'package:flutter/material.dart';

class JenisKanker extends StatelessWidget {
  final String images;
  final String type;
  const JenisKanker({required this.images, required this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 3),
      child: Card(
        elevation: 6,
        color: kTextColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 5, right: 5, top: 5),
              height: 120,
              width: 180,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(images)),
              ),
            ),
            Container(
              height: 40,
              width: 190,
              child: Center(
                child: Text(
                  type,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kBackgroundColor,
                      fontFamily: 'Poppins',
                      fontSize: 15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
