import 'package:flutter/material.dart';

import '../../../const.dart';

class MelArticle extends StatelessWidget {
  const MelArticle({Key? key}) : super(key: key);

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
                image: AssetImage('assets/images/mel.jpg'), fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
          child: Text(
            '\t\t\t\tKanker kulit melanoma adalah kanker kulit yang berkembang dari melanosit. Selain di kulit, melanoma juga dapat muncul di mata. Bahkan, pada kasus yang jarang terjadi, melanoma bisa tumbuh di dalam hidung atau tenggorokan. Melanosit adalah sel pigmen kulit yang berfungsi menghasilkan melanin, yaitu pigmen yang menghasilkan warna kulit manusia. Melanin inilah yang bekerja menyerap sinar ultraviolet dan melindungi kulit dari kerusakan.\n\t\t\t\tMelanoma adalah jenis kanker kulit yang jarang terjadi, tetapi sangat berbahaya. Kanker ini dimulai dari kulit manusia dan dapat menyebar ke organ lain di dalam tubuh jika terlambat ditangani.',
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
