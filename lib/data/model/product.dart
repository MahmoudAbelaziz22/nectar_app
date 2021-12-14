import 'package:nectar_app/data/model/image.dart';

class Product {
  Product(
      {this.category,
      this.describtion,
      this.id,
      this.images,
      this.offer,
      this.price,
      this.priceg,
      this.productName});

  Product.fromJson(Map<String, dynamic> json) {
    this.category = json["category"];
    this.describtion = json["describtion"];
    this.id = json["id"];
    this.images =
        json["images"] == null ? null : Images.fromJson(json["images"]);
    this.offer = json["offer"];
    this.price = json["price"];
    this.priceg = json["priceg"];
    this.productName = json["productName"];
  }

  String? category;
  String? describtion;
  int? id;
  Images? images;
  double? offer;
  double? price;
  String? priceg;
  String? productName;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["category"] = this.category;
    data["describtion"] = this.describtion;
    data["id"] = this.id;
    if (this.images != null) data["images"] = this.images?.toJson();
    data["offer"] = this.offer;
    data["price"] = this.price;
    data["priceg"] = this.priceg;
    data["productName"] = this.productName;
    return data;
  }
}
