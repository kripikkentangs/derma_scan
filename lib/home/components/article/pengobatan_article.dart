import 'package:flutter/material.dart';

import '../../../const.dart';

class PengobatanArticle extends StatelessWidget {
  const PengobatanArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  buildBody() {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            image: DecorationImage(
                image: AssetImage('assets/images/pengobatan.jpg'),
                fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\t\t\t\tPengobatan kanker kulit tergantung pada jenis, lokasi, dan stadium kanker kulit. Ada beberapa jenis pengobatan yang dapat dilakukan, yaitu:\n',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 15, fontFamily: 'Poppins', color: kTextColor),
              ),
              Text(
                '-\tKrim untuk kanker kulit\nMetode pengobatan dengan pemberian krim dilakukan untuk mengobati kanker stadium awal yang hanya menyerang lapisan atas kulit.\n',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 15, fontFamily: 'Poppins', color: kTextColor),
              ),
              Text(
                '-\tKrioterapi\nKrioterapi dilakukan dengan menggunakan nitrogen cair untuk menghasilkan suhu dingin dan membunuh sel kanker pada stadium awal.\n',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 15, fontFamily: 'Poppins', color: kTextColor),
              ),
              Text(
                '-\tOperasi\nOperasi dilakukan dengan mengangkat jaringan kanker beserta bagian kulit sehat di sekitarnya. Operasi juga dapat dilakukan dengan mengangkat tumor yang tumbuh di tiap lapisan kulit dan memeriksa tiap lapisan di bawah mikroskop hingga tidak ada lagi sel kanker yang tersisa (operasi Mohs).\n',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 15, fontFamily: 'Poppins', color: kTextColor),
              ),
              Text(
                '-\tKuretase\nMetode pengobatan ini dilakukan dengan mengangkat jaringan kanker menggunakan alat khusus yang disebut kuret. Kemudian, sel kanker yang tersisa akan dibakar dengan jarum listrik (kauterisasi).\n',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 15, fontFamily: 'Poppins', color: kTextColor),
              ),
              Text(
                '-\tRadioterapi\nPengobatan ini dilakukan dengan memaparkan radiasi untuk membunuh sel kanker. Radioterapi digunakan ketika pembedahan tidak dapat dilakukan atau penyebaran sel kanker telah meluas.\n',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 15, fontFamily: 'Poppins', color: kTextColor),
              ),
              Text(
                '-\tKemoterapi\nKemoterapi dilakukan dengan memberikan obat-obatan yang diminum atau disuntik untuk membunuh sel kanker.\n',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 15, fontFamily: 'Poppins', color: kTextColor),
              ),
              Text(
                '-\tTerapi biologis\nTerapi biologis dilakukan dengan memberikan obat atau zat yang dapat merangsang sistem kekebalan tubuh untuk melawan sel kanker.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 15, fontFamily: 'Poppins', color: kTextColor),
              ),
            ],
          ),
        )
      ],
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
