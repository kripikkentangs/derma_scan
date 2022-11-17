import 'package:flutter/material.dart';

class HistoryHive extends StatelessWidget {
  const HistoryHive({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'History Hive'
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black45,
      ),
    );
  }
}