import 'package:flutter_coffee_shop/src/features/menu/models/model_coffee_card.dart';

class CategoryModel {
  final String categoryName;
  final List<ModelCoffeeCard> cards;

  const CategoryModel({
    required this.categoryName,
    required this.cards,
  });

  factory CategoryModel.fromJSON(Map<String, dynamic> json) {
    return CategoryModel(
      categoryName: json['categoryName'],
      cards: json['cards'],
    );
  }
}