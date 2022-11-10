import 'package:derma_scan/historySqf/history_sqf.dart';
import 'package:flutter/material.dart';

import 'home/home_screen.dart';
import 'scan/scan_view.dart';

class NavigationDrawerWidget extends StatelessWidget {
  NavigationDrawerWidget({Key? key}) : super(key: key);
  final padding = EdgeInsets.symmetric(horizontal: 10);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.grey[850],
        child: ListView(
          padding: padding,
          children: [
            const SizedBox(height: 48),
            const SizedBox(height: 5),
            buildMenuItem(
              text: 'Home',
              icon: Icons.home_filled,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 5),
            buildMenuItem(
              text: 'Scan',
              icon: Icons.camera_alt,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(height: 5),
            buildMenuItem(
              text: 'History SQLite',
              icon: Icons.history,
              onClicked: () => selectedItem(context, 2),
            ),
            const SizedBox(height: 5),
            Divider(
              color: Color(0xFFEEEDE7),
            ),
            const SizedBox(height: 5),
            buildMenuItem(
              text: 'About',
              icon: Icons.info,
              onClicked: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text('Derma Scan'),
                  content: Text(
                    'Aplikasi untuk mengklasifikasi kanker kulit manusia.\n\nDeveloped by Bayu Satya Saputra',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Close'),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Color(0xFFEEEDE7);

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      onTap: onClicked,
    );
  }

  selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Scan()));
        break;
      case 2:
      Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HistorySqf()));
        break;
    }
  }
}
