import 'package:flutter_coffee_shop/src/features/menu/models/model_coffee_card.dart';
import 'package:flutter_coffee_shop/src/features/menu/models/model_coffee_title.dart';

const categories = [
  CategoryModel(
    categoryName: 'Черный кофе',
    cards: [
      ModelCoffeeCard(name: 'Эспрессо', price: 139),
      ModelCoffeeCard(name: 'Американо', price: 150),
    ],
  ),
  CategoryModel(
    categoryName: 'Кофе с добавлением молока',
    cards: [
      ModelCoffeeCard(name: 'Капучино', price: 180),
      ModelCoffeeCard(name: 'Латте', price: 190),
    ],
  ),
  CategoryModel(
    categoryName: 'Чай',
    cards: [
      ModelCoffeeCard(name: 'Зеленый', price: 120),
      ModelCoffeeCard(name: 'Чёрный', price: 120),
    ],
  ),
  CategoryModel(
    categoryName: 'Авторские напитки',
    cards: [
      ModelCoffeeCard(name: 'Раф', price: 200),
      ModelCoffeeCard(name: 'Лимонад', price: 190),
    ],
  ),
];