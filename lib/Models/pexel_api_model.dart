class PexelApiModel {
  String? url;
  SrcModel? src;
  PexelApiModel({this.url, this.src});

  factory PexelApiModel.fromMap(Map<String, dynamic> parsedJson) {
    return PexelApiModel(
      url: parsedJson["url"],
      src: SrcModel.fromMap(parsedJson["src"]),
    );
  }
}

class SrcModel {
  String? portrait;
  String? large;
  String? landscape;
  String? medium;

  SrcModel({this.landscape, this.large, this.medium, this.portrait});

  factory SrcModel.fromMap(Map<String, dynamic> srcJson) {
    return SrcModel(
      portrait: srcJson["portrait"],
      landscape: srcJson["landscape"],
      medium: srcJson["medium"],
      large: srcJson["large"],
    );
  }
}
