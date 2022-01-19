class CartItem {
  int? productId;
  String? productName;
  String? productPriceg;
  String? productImage;
  int? quantity;
  double? productPrice;

  CartItem(
      {this.productId,
      this.productName,
      this.productImage,
      this.quantity,
      this.productPrice,
      this.productPriceg});

  CartItem.fromJson(Map<String, dynamic> json) {
    this.productId = json["productId"];
    this.productName = json["productName"];
    this.productPriceg = json["productPriceg"];
    this.productImage = json["productImage"];
    this.productPrice = json["productPrice"];
    this.quantity = json["quantity"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["productId"] = this.productId;
    data["productName"] = this.productName;
    data["productPriceg"] = this.productPriceg;
    data["productImage"] = this.productImage;
    data["productPrice"] = this.productPrice;
    data["quantity"] = this.quantity;
    return data;
  }
}
