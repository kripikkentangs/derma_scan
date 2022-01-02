import 'package:flutter/material.dart';

import '../../../const.dart';

class BccArticle extends StatelessWidget {
  const BccArticle({Key? key}) : super(key: key);

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
                image: AssetImage('assets/images/bcc.jpg'), fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
          child: Text(
            '\t\t\t\tKarsinoma Sel Sasal atau Basal Cell Carcinoma adalah kanker kulit yang menyerang sel basal. Kanker ini umumnya muncul di area kulit yang sering terkena sinar matahari, seperti wajah, kepala, atau leher. Sel basal adalah sel yang terletak di bagian paling bawah dari lapisan kulit terluar (epidermis). Sel ini berfungsi untuk memproduksi sel kulit baru dan menggantikan sel kulit lama yang mati melalui proses pengelupasan kulit. Pada karsinoma sel basal, produksi sel kulit menjadi tidak terkendali sehingga membentuk kanker.\n\t\t\t\tKarsinoma sel basal merupakan jenis kanker kulit yang paling sering terjadi, yaitu sekitar 75% dari semua kasus kanker kulit. Kanker ini cenderung tumbuh dengan lambat dan tidak menimbulkan gejala dalam waktu yang lama. Karsinoma sel basal juga umumnya tidak menyebar ke organ lain (metastasis). Akan tetapi, jika tidak ditangani dengan tepat, karsinoma sel basal bisa menyebar ke organ dan jaringan tubuh yang sehat di sekitarnya.',
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontSize: 15, fontFamily: 'Poppins', color: kTextColor),
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
