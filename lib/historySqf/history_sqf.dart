import 'package:derma_scan/const.dart';
import 'package:derma_scan/db/db_helper.dart';
import 'package:derma_scan/model/model.dart';
import 'package:flutter/material.dart';

class HistorySqf extends StatefulWidget {
  const HistorySqf({Key? key}) : super(key: key);

  @override
  _HistorySqfState createState() => _HistorySqfState();
}

class _HistorySqfState extends State<HistorySqf> {
  List<Hasil> listHasil = [];
  DbHelper db = DbHelper();

  @override
  void initState() {
    _getAllHasil();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppbar(),
        body: ListView.builder(
            itemCount: listHasil.length,
            itemBuilder: (BuildContext context, int index) {
              Hasil hasil = listHasil[index];
              return ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                title: Text(
                  '${hasil.image}',
                  style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.deepOrangeAccent),
                ),
                // subtitle: Text('${hasil.confidenceFix}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    AlertDialog hapus = AlertDialog(
                      title: Text('Information'),
                      content: Container(
                        height: 100,
                        child: Column(
                          children: [
                            Text(
                                'Apakah anda yakin ingin menghapus data ${hasil.output}'),
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

  Future<void> _getAllHasil() async {
    var list = await db.getAllHasil();
    setState(() {
      listHasil.clear();
      list!.forEach((hasil) {
        listHasil.add(Hasil.fromMap(hasil));
      });
    });
  }

  Future<void> _deleteHasil(Hasil hasil, int position) async {
    await db.deleteHasil(hasil.id!);

    setState(() {
      listHasil.removeAt(position);
    });
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
