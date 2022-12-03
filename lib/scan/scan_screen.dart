import 'package:flutter/material.dart';

import '../const.dart';
import 'components/body_scan.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: BodyScan(),
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: BackButton(
        color: kTextColor,
      ),
      title: Text(
        'Scan',
        style: kDefaultFont,
      ),
    );
  }
}
