import 'package:flutter/material.dart';

import '../../const.dart';

class JenisKanker extends StatelessWidget {
  const JenisKanker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Jenis-jenis Kanker Kulit",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: kTextColor,
              fontFamily: 'Poppins',
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
