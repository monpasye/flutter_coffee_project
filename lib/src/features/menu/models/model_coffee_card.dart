class ModelCoffeeCard {
  final String name;
  final int price;
  final String? icon;

  const ModelCoffeeCard({
    required this.name,
    required this.price,
    this.icon,
  });

  factory ModelCoffeeCard.fromJSON(Map<String, dynamic> json) {
    return ModelCoffeeCard(
      icon: json['icon'],
      name: json['name'],
      price: json['price'],
    );
  }

}