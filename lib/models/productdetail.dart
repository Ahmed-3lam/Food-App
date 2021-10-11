class ProductModel {
  final String image;
  final int price;
  final int quant;
  ProductModel({
    required this.image,
    required this.price,
    required this.quant,
  });
}

class ProductItem {
  int quantity;
  final ProductModel? product;

  ProductItem({this.quantity = 1, required this.product});

  void increment() {
    quantity++;
  }
}
