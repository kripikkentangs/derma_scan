import 'package:flutter/material.dart';

import '../../../const.dart';

class HeaderArticle extends StatelessWidget {
  const HeaderArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Center(
            child: Text('Header Content Page'),
          )
        ],
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
        'Read More',
        style: kDefaultFont,
      ),
    );
  }
}
