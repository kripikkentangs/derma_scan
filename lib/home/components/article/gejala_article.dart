import 'package:flutter/material.dart';

import '../../../const.dart';

class GejalaArticle extends StatelessWidget {
  const GejalaArticle({Key? key}) : super(key: key);

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
                image: AssetImage('assets/images/gejala.jpg'),
                fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\t\t\t\tGejala atau tanda kanker kulit umumnya muncul pada bagian tubuh yang sering terpapar sinar matahari, seperti kulit kepala, wajah, telinga, leher, lengan, atau  tungkai. Akan tetapi, kanker kulit juga dapat terjadi di bagian tubuh yang jarang terkena sinar matahari, seperti telapak tangan, kaki, atau bahkan area kelamin.\n',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 15, fontFamily: 'Poppins', color: kTextColor),
              ),
              Text(
                'Gejala Pada Karsinoma Sel Basal',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    color: kTextColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '\t\t\t\tGejala karsinoma sel basal umumnya muncul di bagian tubuh yang sering terpapar sinar matahari. Akan tetapi, gejala juga bisa muncul di bagian tubuh yang tertutup.\nKarsinoma sel basal umumnya tidak menimbulkan nyeri. Namun, kondisi ini dapat menyebabkan keluhan berikut:',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 15, fontFamily: 'Poppins', color: kTextColor),
              ),
              Text(
                '-\tBenjolan berwarna merah muda, cokelat, atau hitam, yang memiliki pembuluh darah di dalamnya.\n-\tRuam kulit yang bersisik dan kemerahan.\n-\tLuka terbuka yang tidak kunjung membaik.\n-\tLuka yang terasa gatal dan mudah berdarah.\n',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 15, fontFamily: 'Poppins', color: kTextColor),
              ),
              Text(
                'Gejala Pada Melanoma',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    color: kTextColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '\t\t\t\tMelanoma ditandai dengan kemunculan tahi lalat baru atau adanya perubahan pada tahi lalat lama. Perubahan ini bisa mencakup bentuk dan warna tahi lalat. Selain itu, tahi lalat yang terserang melanoma bisa terasa gatal dan mengalami perdarahan',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 15, fontFamily: 'Poppins', color: kTextColor),
              ),
              Text(
                'Melanoma yang muncul di lokasi yang tidak biasa, seperti mata atau kuku, dapat memunculkan keluhan lain, berupa:',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 15, fontFamily: 'Poppins', color: kTextColor),
              ),
              Text(
                '-\tPenglihatan kabur, floaters, atau titik hitam di bagian putih mata.\n-\tBagian bawah kuku menghitam tanpa sebab.\n',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 15, fontFamily: 'Poppins', color: kTextColor),
              ),
              Text(
                'Gejala Pada Karsinoma Sel Skuamosa',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    color: kTextColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '\t\t\t\tKarsinoma sel skuamosa umumnya menyerang kulit yang terpapar sinar matahari, misalnya kulit kepala, tangan, telinga, dan bibir. Akan tetapi, gejala juga bisa muncul di bagian tubuh lain, seperti di dalam mulut, telapak kaki, serta area kelamin dan anus.\nGejala awal karsinoma sel skuamosa pada kulit adalah munculnya bercak merah yang bersisik atau benjolan yang terasa kering, gatal, dan berubah warna (solar keratosis). Pada bagian dalam mulut, misalnya lidah, gusi, atau dinding mulut, gejala awalnya dapat berupa bercak putih yang tidak bisa dibersihkan (leukoplakia).\nJika sudah berkembang, tanda dan gejala karsinoma sel skuamosa yang dapat terjadi antara lain:',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 15, fontFamily: 'Poppins', color: kTextColor),
              ),
              Text(
                '-\tBenjolan merah yang keras, terlihat seperti kutil.\n-\tBercak merah kasar yang berkerak, bersisik, dan mudah berdarah.\n-\tLuka terbuka yang tidak kunjung sembuh.\n-\tLuka dengan pinggiran yang menonjol dan dasar luka yang gatal dan mudah berdarah.',
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
