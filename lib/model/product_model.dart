class ProductModel {
  final String title;
  final double price;
  final String image;
  int quantity;

  ProductModel({
    required this.title,
    required this.price,
    required this.image,
    this.quantity = 1,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json["title"] ?? "No Title",
      price: (json["price"] ?? 0).toDouble(),
      // image: json["image"] ??
      //     "https://via.placeholder.com/150" ,
      image: json["thumbnail"] ?? "",
    );
  }
}
