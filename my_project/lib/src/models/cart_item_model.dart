import 'product_model.dart';

class CartItemModel {
  final ProductModel product;
  int quantity;

  CartItemModel({
    required this.product,
    this.quantity = 1,
  });

  double get totalPrice {
    // Agora que product.price é double, o cálculo é direto e seguro
    return product.price * quantity;
  }
}
