import 'dart:convert';

import 'package:derma_scan/const.dart';
import 'package:derma_scan/db/db_helper.dart';
import 'package:derma_scan/model/model.dart';
// import 'package:derma_scan/model/utility.dart';
// import 'package:derma_scan/model/utility.dart';
import 'package:flutter/material.dart';
// import 'dart:convert';
import 'dart:async';
// import 'dart:typed_data';
// import 'dart:io';

class HistorySqf extends StatefulWidget {
  const HistorySqf({Key? key}) : super(key: key);

  @override
  _HistorySqfState createState() => _HistorySqfState();
}

class _HistorySqfState extends State<HistorySqf> {
  // List<Hasil> listHasil = [];
  DbHelper db = DbHelper();

  late String image;
  late List<Hasil> images;

  @override
  void initState() {
    _getAllHasil();
    super.initState();
    images = [];
    // DbHelper db = DbHelper();
  }

  Future<void> _getAllHasil() async {
    var list = await db.getAllHasil();
    setState(() {
      images.clear();
      list!.forEach((hasil) {
        images.add(Hasil.fromMap(hasil));
      });
    });
  }

  Future<void> _deleteHasil(Hasil hasil, int position) async {
    await db.deleteHasil(hasil.id!);

    setState(() {
      images.removeAt(position);
    });
  }

  dynamic decodeBase64(String images) {
    String decoded = utf8.decode(base64Url.decode(images));
    return decoded;
  }

  @override
  Widget build(BuildContext context) {
    // Uint8List base64Decode(String images) => base64.decode(images);
    // Uint8List bytes = Base64Decoder().convert(images);
    // String img = base64Decode(images);
    // Uint8List decodedbytes = base64.decode(image);
    return Scaffold(
        appBar: buildAppbar(),
        body: ListView.builder(
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              Hasil hasil = images[index];
              return ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 44,
                      minHeight: 44,
                      maxWidth: 64,
                      maxHeight: 64,
                    ),
                    child: Text("${hasil.image}")),
                // subtitle: Text('${hasil.output}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    AlertDialog hapus = AlertDialog(
                      title: Text('Information'),
                      content: Container(
                        height: 100,
                        child: Column(
                          children: [
                            Text('Apakah anda yakin ingin menghapus data?'),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: Text('Ya'),
                          onPressed: () {
                            //delete
                            _deleteHasil(hasil, index);
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: Text('Tidak'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                    showDialog(context: context, builder: (context) => hapus);
                  },
                ),
              );
            }));
  }

  AppBar buildAppbar() {
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
