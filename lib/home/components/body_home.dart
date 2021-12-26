import 'package:derma_scan/home/components/header.dart';
import 'package:derma_scan/home/components/scan_button.dart';
import 'package:flutter/material.dart';

import 'jenis_kanker.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Header(),
          ScanButton(),
          JenisKanker(),
        ],
      ),
    );
  }
}
