import 'dart:io';

import 'dart:typed_data';

class Hasil {
  int? id;
  String? image;
  String? output;
  String? confidenceFix;

  Hasil({this.id, this.image, this.output, this.confidenceFix});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map["id"] = id;
    }
    map["image"] = image;
    map["output"] = output;
    map["confidenceFix"] = confidenceFix;
    return map;
  }

  Hasil.fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.image = map["image"];
    this.output = map["output"];
    this.confidenceFix = map["confidenceFix"];
  }
}
