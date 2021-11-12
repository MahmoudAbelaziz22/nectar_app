class Images {
  String? img1;
  String? img2;

  Images({this.img1, this.img2});

  Images.fromJson(Map<String, dynamic> json) {
    this.img1 = json["img1"];
    this.img2 = json["img2"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["img1"] = this.img1;
    data["img2"] = this.img2;
    return data;
  }
}
