import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 1) 
class Product extends HiveObject {

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final double price;

  @HiveField(4)
  final String thumbnail;

  @HiveField(5)
  final double rating;

  @HiveField(6)
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.thumbnail,
    required this.rating,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      thumbnail: json['thumbnail'],
      rating: (json['rating'] as num).toDouble(),
      images: List<String>.from(json['images']),
    );
  }
}