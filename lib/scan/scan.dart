import 'package:flutter/material.dart';

import '../const.dart';
import 'components/body_scan.dart';

class Scan extends StatelessWidget {
  const Scan({Key? key}) : super(key: key);

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
      brightness: Brightness.light,
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
