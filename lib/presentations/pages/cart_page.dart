import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../../routes/app_routes.dart';
import '../widgets/cart_item_tile.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return const Center(
            child: Text(
              'Your cart is empty!',
              style: TextStyle(fontSize: 18),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 100),
          itemCount: cartController.cartItems.length,
          itemBuilder: (context, index) {
            final cartItem = cartController.cartItems[index];
            return CartItemTile(cartItem: cartItem);
          },
        );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: Obx(() {
          return ElevatedButton(
            onPressed: () {
              Get.toNamed(AppRoutes.orderSummary);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Proceed to Checkout (${cartController.cartItems.length} items)',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          );
        }),
      ),
    );
  }
}
