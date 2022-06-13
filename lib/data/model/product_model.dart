import 'dart:ffi';

class ProductModel {
  final int id;
  final String title;
  final String description;
  final int price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<dynamic> images;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.rating,
    required this.discountPercentage,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory ProductModel.fromJson(Map data) {
    return ProductModel(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      price: data['price'],
      discountPercentage:
          double.tryParse(data['discountPercentage'].toString())!,
      stock: data['stock'],
      rating: double.tryParse(data['rating'].toString())!,
      brand: data['brand'],
      category: data['category'],
      thumbnail: data['thumbnail'],
      images: data['images'],
    );
  }
}
