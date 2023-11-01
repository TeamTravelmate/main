class ProductDetail {
  final int? id;
  final int? vendor_essential_id;
  final String? colour;
  final String? size;
  final String? price;
  final int? quantity;
  final String? name;
  final String? photo;
  final String? description;
  final int? vendor_id;

  ProductDetail({
     this.id,
     this.vendor_essential_id,
     this.colour,
     this.size,
     this.price,
     this.quantity,
     this.name,
     this.description,
     this.photo,
     this.vendor_id
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) {
    return ProductDetail(
      id: json['id'],
      vendor_essential_id: json['vendor_essential_id'],
      colour: json['colour'],
      size: json['size'],
      price: json['price'],
      quantity: json['quantity'],
      photo: json['photo'],
      name: json['vendor_essential']['assential_name'],
      description: json['vendor_essential']['description'],
      vendor_id: json['vendor_essential']['user_id'],
    );
  }

  // static List<ProductDetail> fromJsonList(List<dynamic> jsonList) {
  //   return jsonList.map((product) => ProductDetail.fromJson(product)).toList();
  // }
}
