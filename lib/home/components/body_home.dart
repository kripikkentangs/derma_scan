import 'package:derma_scan/home/components/article/bcc_article.dart';
import 'package:derma_scan/home/components/article/pencegahan_article.dart';
import 'package:derma_scan/home/components/article/pengobatan_article.dart';
import 'package:derma_scan/home/components/content.dart';
import 'package:derma_scan/home/components/header.dart';
import 'package:derma_scan/home/components/scan_button.dart';
import 'package:derma_scan/home/components/title_content.dart';
import 'package:flutter/material.dart';

import 'article/gejala_article.dart';
import 'article/mel_article.dart';
import 'article/scc_article.dart';
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
          // card jenis kanker
          Container(
              height: 185,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BccArticle()),
                        );
                      },
                      child: JenisKanker(
                        images: 'assets/images/bcc.jpg',
                        type: 'Basal Cell Carcinoma',
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MelArticle()),
                      );
                    },
                    child: JenisKanker(
                      images: 'assets/images/mel.jpg',
                      type: 'Melanoma',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SccArticle()),
                      );
                    },
                    child: JenisKanker(
                      images: 'assets/images/scc.jpg',
                      type: 'Squamous Cell Carcinoma',
                    ),
                  ),
                ],
              )),
          TitleContent(titles: 'Tentang Kanker Kulit'),
          // card content
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GejalaArticle()),
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
                MaterialPageRoute(builder: (context) => PencegahanArticle()),
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
                MaterialPageRoute(builder: (context) => PengobatanArticle()),
              );
            },
            child: Content(
              content: 'Pengobatan Kanker Kulit',
              image: 'assets/images/pengobatan.jpg',
            ),
          ),
        ],
      ),
    );
  }
}
