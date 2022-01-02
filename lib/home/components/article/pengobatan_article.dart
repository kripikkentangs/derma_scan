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
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Text(
            'Kanker kulit adalah jenis kanker yang tumbuh di jaringan kulit. Kondisi ini ditandai dengan perubahan pada kulit, seperti munculnya benjolan, bercak, atau tahi lalat dengan bentuk dan ukuran yang tidak normal. \nAda tiga jenis kanker kulit yang paling sering terjadi, yaitu:\n- Karsinoma sel basal, yaitu kanker kulit yang berasal dari sel di bagian terdalam dari lapisan kulit terluar (epidermis).\n- Karsinoma sel skuamosa, yaitu kanker kulit yang berasal dari sel di bagian tengah dan terluar dari epidermis.\n- Melanoma, yaitu kanker kulit yang berasal dari sel penghasil pigmen kulit (melanosit).',
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
