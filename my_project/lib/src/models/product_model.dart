import 'rating_model.dart';

enum ProductCategory { destaque, novidade, maisVendido, promocao }

extension ProductCategoryExtension on ProductCategory {
  String get title {
    switch (this) {
      case ProductCategory.destaque:
        return 'Destaques';
      case ProductCategory.novidade:
        return 'Novidades';
      case ProductCategory.maisVendido:
        return 'Mais Vendidos';
      case ProductCategory.promocao:
        return 'Promoções';
    }
  }
}

class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.description,
    this.ratings = const [],
  });

  final String id;
  final String name;
  final ProductCategory category;
  final String imageUrl;
  final String price;
  final String description;
  final List<RatingModel> ratings;

  double get averageRating {
    if (ratings.isEmpty) return 0.0;
    final total = ratings.fold<double>(
      0.0,
      (sum, rating) => sum + rating.stars,
    );
    return total / ratings.length;
  }

  int get reviewsCount => ratings.length;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      category: ProductCategory.values.firstWhere(
        (value) => value.name == json['category'] as String?,
        orElse: () => ProductCategory.promocao,
      ),
      imageUrl: json['imageUrl'] as String? ?? '',
      price: json['price'] as String? ?? '',
      description: json['description'] as String? ?? '',
      ratings:
          (json['ratings'] as List<dynamic>?)
              ?.map(
                (item) => RatingModel.fromJson(item as Map<String, dynamic>),
              )
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category.name,
      'imageUrl': imageUrl,
      'price': price,
      'description': description,
      'ratings': ratings.map((rating) => rating.toJson()).toList(),
    };
  }
}
