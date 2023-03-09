class Hasil {
  int? id;
  String? image;
  // String? output;
  // String? confidenceFix;

  Hasil(int i, String imgString) {
    this.image = imgString;
    // this.output;
    // this.confidenceFix;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map["id"] = id;
    map["image"] = image;
    // map["output"] = output;
    // map["confidenceFix"] = confidenceFix;
    return map;
  }

  Hasil.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    image = map["image"];
    // output = map["output"];
    // confidenceFix = map["confidenceFix"];
  }
}
