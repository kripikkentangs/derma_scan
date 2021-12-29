import 'package:derma_scan/home/components/header_content.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Stack(
        children: [
          Container(
            height: 210,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                  image: AssetImage('assets/images/kanker-kulit.jpg'),
                  fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HeaderContent()),
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 15,
            child: Text(
              'Apa Itu Kanker Kulit?',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Color(0xFF4D4D4D),
                      offset: Offset(1, 1.7),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
