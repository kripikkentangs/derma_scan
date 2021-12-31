import 'package:derma_scan/home/components/content.dart';
import 'package:derma_scan/home/components/header.dart';
import 'package:derma_scan/home/components/scan_button.dart';
import 'package:derma_scan/home/components/title_content.dart';
import 'package:derma_scan/scan/scan.dart';
import 'package:flutter/material.dart';

import 'article/header_article.dart';
import 'jenis_kanker.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Header(),
          ScanButton(),
          TitleContent(titles: 'Jenis-jenis Kanker Kulit'),
          Container(
              height: 183,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  JenisKanker(
                    images: 'assets/images/dokter.jpg',
                    type: 'Basal Cell Carcinoma',
                  ),
                  JenisKanker(
                    images: 'assets/images/dokter.jpg',
                    type: 'Melanoma',
                  ),
                  JenisKanker(
                    images: 'assets/images/dokter.jpg',
                    type: 'Squamous Cell Carcinoma',
                  ),
                ],
              )),
          TitleContent(titles: 'Tentang Kanker Kulit'),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HeaderArticle()),
              );
            },
            child: Content(
              content: 'Gejala Umum Kanker Kulit',
              image: 'assets/images/gejala.jpg',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Scan()),
              );
            },
            child: Content(
              content: 'Pencegahan Kanker Kulit',
              image: 'assets/images/pencegahan.jpg',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HeaderArticle()),
              );
            },
            child: Content(
              content: 'Pengobatan Kanker Kulit',
              image: 'assets/images/pencegahan.jpg',
            ),
          ),
        ],
      ),
    );
  }
}
