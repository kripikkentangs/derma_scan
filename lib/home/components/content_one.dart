import 'package:flutter/material.dart';

class ContentOne extends StatelessWidget {
  const ContentOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Card(
        elevation: 6,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.all(5),
                height: 60,
                // width: 110,
                color: Colors.black,
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  'Dampak Jangka Panjang Kanker Kulit',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
