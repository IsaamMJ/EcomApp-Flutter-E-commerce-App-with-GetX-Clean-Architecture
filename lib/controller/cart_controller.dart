import 'package:get/get.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/entities/api_data_entities.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;
  final orders = <Map<String, dynamic>>[].obs;

  void addToCart(ApiDataEntity product) {
    int index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      cartItems[index].quantity++;
      cartItems[index] = cartItems[index];
    } else {
      cartItems.add(CartItem(product: product));
    }
  }

  void removeFromCart(ApiDataEntity product) {
    cartItems.removeWhere((item) => item.product.id == product.id);
  }

  void clearCart() {
    cartItems.clear();
  }

  int get totalItemsCount => cartItems.fold(0, (sum, item) => sum + item.quantity);
  void incrementQuantity(ApiDataEntity product) {
    final index = cartItems.indexWhere((e) => e.product.id == product.id);
    if (index >= 0) {
      cartItems[index].quantity++;
      cartItems.refresh();
    }
  }

  void decrementQuantity(ApiDataEntity product) {
    final index = cartItems.indexWhere((e) => e.product.id == product.id);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        cartItems.removeAt(index);
      }
      cartItems.refresh();
    }
  }
}

