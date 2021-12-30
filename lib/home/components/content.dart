import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  final String content;
  final String image;
  const Content({required this.content, required this.image});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(image),
                          // image: AssetImage('assets/images/dokter.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      // 'Kapan Harus Menghubungi Dokter',
                      content,
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
