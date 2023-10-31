class Products {
  final int? id;
  final int? vendor_essential_id;
  final String? colour;
  final String? size;
  final String? price;
  final int? quantity;
  final String? photo;
  final String? assential_name;
  final String? description;

  Products({
    required this.id,
    required this.vendor_essential_id,
    required this.colour,
    required this.size,
    required this.price,
    required this.quantity,
    required this.photo,
    required this.assential_name,
    required this.description
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      vendor_essential_id: json['vendor_essential_id'],
      colour: json['colour'],
      size: json['size'],
      price: json['price'],
      quantity: json['quantity'],
      photo: json['photo'],
      assential_name: json['vendor_essential']['assential_name'],
      description: json['vendor_essential']['description'],
    );
  }

  static List<Products> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((user) => Products.fromJson(user)).toList();
  }
}

class ProductDetail {
  final int? id;
  final int? vendor_essential_id;
  final String? colour;
  final String? size;
  final String? price;
  final int? quantity;
  final String? photo;
  final String? assential_name;
  final String? description;

  ProductDetail({
    required this.id,
    required this.vendor_essential_id,
    required this.colour,
    required this.size,
    required this.price,
    required this.quantity,
    required this.photo,
    required this.assential_name,
    required this.description
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
      assential_name: json['vendor_essential']['assential_name'],
      description: json['vendor_essential']['description'],
    );
  }

  static List<ProductDetail> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((user) => ProductDetail.fromJson(user)).toList();
  }
}