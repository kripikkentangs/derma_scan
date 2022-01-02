import 'package:flutter/material.dart';

import '../../../const.dart';

class SccArticle extends StatelessWidget {
  const SccArticle({Key? key}) : super(key: key);

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
                image: AssetImage('assets/images/scc.jpg'), fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
          child: Text(
            '\t\t\t\tKarsinoma Sel Skuamosa atau Squamous Cell Carcinoma adalah kanker kulit yang menyerang sel skuamosa, yaitu sel yang membentuk lapisan tengah dan luar kulit. Kanker ini umumnya muncul di wajah, leher, tangan, dan kaki. Karsinoma sel skuamosa (KSS) menempati peringkat kedua untuk jenis kanker kulit yang paling sering terjadi. Meski biasanya muncul di area kulit yang sering terpapar sinar matahari, KSS juga dapat menyerang bagian tubuh lain yang memiliki sel skuamosa.\n\t\t\t\tKarsinoma sel skuamosa adalah jenis kanker kulit yang pertumbuhannya cenderung lambat. Namun, tidak seperti kanker kulit lain, kanker jenis ini dapat menyebar ke tulang dan organ tubuh lain. Pada kondisi ini, KSS akan lebih susah untuk disembuhkan.',
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
