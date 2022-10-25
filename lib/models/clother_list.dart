class ClothesModel {
  String img;
  String name;
  String type;
  int price;

  ClothesModel({
    required this.img,
    required this.name,
    required this.type,
    required this.price,
  });

  static List<ClothesModel> clothes = [
    ClothesModel(
      img: "assets/images/sweeter.png",
      name: "Tech Fleece",
      type: "Men's Pullover Hoodie",
      price: 110,
    ),
    ClothesModel(
      img: "assets/images/blouse.png",
      name: "Indy Luxe",
      type: "Women's Light-Support",
      price: 36,
    ),
    ClothesModel(
      img: "assets/images/sneaker1.png",
      name: "Space Hippi",
      type: "Women's Shoes",
      price: 130,
    ),
  ];
}
