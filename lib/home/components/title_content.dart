import 'package:flutter/material.dart';

import '../../const.dart';

class TitleContent extends StatelessWidget {
  final String titles;
  const TitleContent({required this.titles});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titles,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: kTextColor,
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
