import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Card(
        elevation: 6,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.all(5),
                height: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/dokter.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  'Kapan Harus Menghubungi Dokter',
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
