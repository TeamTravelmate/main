class Products {
  final int? id;
  final int? vendor_essential_id;
  final String? colour;
  final String? size;
  final String? price;
  final int? quantity;
  final String? name;
  final String? description;
  final String? category;
  final int? vendor_id;

  Products({
    required this.id,
    required this.vendor_essential_id,
    required this.colour,
    required this.size,
    required this.price,
    required this.quantity,
    required this.name,
    required this.description,
    required this.category,
    required this.vendor_id
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      vendor_essential_id: json['vendor_essential_id'],
      colour: json['colour'],
      size: json['size'],
      price: json['price'],
      quantity: json['quantity'],
      name: json['vendor_essential']['assential_name'],
      description: json['vendor_essential']['description'],
      category: json['vendor_essential']['category'],
      vendor_id: json['vendor_essential']['user_id'],
    );
  }

  static List<Products> fromJsonList(List<dynamic> jsonList) {
   return jsonList.map((product) => Products.fromJson(product)).toList();
  }
}
