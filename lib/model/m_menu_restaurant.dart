class ModelMenuRestaurant {
  final String imagePath;
  final String nameFood;
  final String priceFood;

  ModelMenuRestaurant({
    this.imagePath,
    this.nameFood,
    this.priceFood,
  });
}

List<ModelMenuRestaurant> listMenuRestaurant = [
  ModelMenuRestaurant(
    imagePath: 'assets/food1.jpeg',
    nameFood: 'Daging Siram',
    priceFood: 'Rp. 5.500',
  ),
  ModelMenuRestaurant(
    imagePath: 'assets/food2.jpeg',
    nameFood: 'Daging Bakar',
    priceFood: 'Rp. 8.500',
  ),
  ModelMenuRestaurant(
    imagePath: 'assets/food3.jpeg',
    nameFood: 'Daging Rebus',
    priceFood: 'Rp. 10.500',
  ),
  ModelMenuRestaurant(
    imagePath: 'assets/food4.jpeg',
    nameFood: 'Kepiting Rebus',
    priceFood: 'Rp. 15.500',
  ),
];