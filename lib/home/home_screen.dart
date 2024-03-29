import 'package:flutter/material.dart';
import '../const.dart';
import '../drawer.dart';
import 'components/body_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: buildAppBar(),
        body: BodyHome(),
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(
            Icons.menu,
            color: kTextColor,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: Text(
        'Derma Scan',
        style: kDefaultFont,
      ),
    );
  }
}
