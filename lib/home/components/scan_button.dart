import 'package:derma_scan/scan/scan.dart';
import 'package:flutter/material.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 20),
        child: ElevatedButton.icon(
          icon: Icon(Icons.open_in_new),
          label: Text(
            'Scan Now',
            style: TextStyle(fontFamily: 'Poppins', color: Color(0xFFEEEDE7)),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Scan()),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF4D4D4D),
            fixedSize: const Size(240, 40),
          ),
        ));
  }
}
