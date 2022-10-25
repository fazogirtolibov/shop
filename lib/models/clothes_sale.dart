class ClothesSale {
  String img;
  String name;
  String discount;
  String price;

  ClothesSale({
    required this.img,
    required this.name,
    required this.discount,
    required this.price,
  });

  static List<ClothesSale> clothes = [
    ClothesSale(
      img: "assets/images/t-shirt.png",
      name: "White polo Shirt with blue design",
      discount: "5% off",
      price: '₦2,300',
    ),
    ClothesSale(
      img: "assets/images/sneaker1.png",
      name: "Sneakers with multiple colours (white as main)",
      discount: "8% off",
      price: '₦5,800',
    ),
  ];
}
