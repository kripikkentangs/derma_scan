import 'package:derma_scan/home/components/content.dart';
import 'package:derma_scan/home/components/header.dart';
import 'package:derma_scan/home/components/scan_button.dart';
import 'package:derma_scan/home/components/title_content.dart';
import 'package:flutter/material.dart';

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
          TitleContent(titles: 'Tentang Kanker Kulit'),
          Content(
            content: 'Gejala Umum Kanker Kulit',
            image: 'assets/images/gejala.jpg',
          ),
          Content(
            content: 'Kapan Harus Menghubungi Dokter',
            image: 'assets/images/dokter.jpg',
          ),
          Content(
            content: 'Pengobatan Kanker Kulit',
            image: 'assets/images/pencegahan.jpg',
          ),
          Content(
            content: 'Pencegahan Kanker Kulit',
            image: 'assets/images/pencegahan.jpg',
          ),
        ],
      ),
    );
  }
}
