import 'package:flutter/material.dart';

import '../../../const.dart';

class PencegahanArticle extends StatelessWidget {
  const PencegahanArticle({Key? key}) : super(key: key);

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
                image: AssetImage('assets/images/pencegahan.jpg'),
                fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\t\t\t\tCara terbaik untuk mencegah kanker kulit adalah melindungi kulit dari paparan sinar matahari atau sumber sinar ultraviolet lainnya, misalnya alat tanning kulit. Langkah yang dapat dilakukan antara lain:',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 15, fontFamily: 'Poppins', color: kTextColor),
              ),
              Text(
                '-\tHindari sinar matahari pada siang hari, karena paparan terkuat sinar ultraviolet dari matahari berlangsung pada jam 10 pagi hingga 4 sore.\n-\tGunakan tabir surya secara rutin, untuk mencegah penyerapan sinar ultraviolet ke dalam kulit dan mengurangi risiko kerusakan kulit akibat sinar matahari.\n-\tGunakan pakaian yang menutupi tubuh, seperti baju lengan panjang dan celana panjang, untuk melindungi kulit dari sinar matahari.\n-\tGunakan pula topi dan kacamata hitam saat keluar rumah, untuk memberikan perlindungan lebih terhadap kepala dan mata dari radiasi sinar matahari.\n-\tHindari penggunaan tanning bed, yaitu alat untuk menggelapkan kulit karena dapat memancarkan radiasi ultraviolet yang berbahaya bagi kulit.\n-\tHati-hati saat menggunakan obat yang menyebabkan efek samping pada kulit, seperti antibiotik. Agar aman, konsultasikan kepada dokter terlebih dulu.\n-\tLakukan pemeriksaan kulit secara rutin dan segera konsultasikan kepada dokter, jika Anda mencurigai adanya perubahan atau kelainan pada kulit.',
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
