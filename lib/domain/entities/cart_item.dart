import 'api_data_entities.dart';

class CartItem {
  final ApiDataEntity product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}
