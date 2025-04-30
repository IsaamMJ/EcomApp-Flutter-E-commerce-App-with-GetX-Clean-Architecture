import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../widgets/order_summary_tile.dart';

  class OrderSummaryScreen extends StatelessWidget {
    const OrderSummaryScreen({super.key});

    @override
    Widget build(BuildContext context) {
      final CartController cartController = Get.find<CartController>();

      return Scaffold(
        appBar: AppBar(
          title: const Text('Order Summary'),
          centerTitle: true,
        ),
        body: Obx(() {
          if (cartController.cartItems.isEmpty) {
            return const Center(
              child: Text(
                'Your cart is empty!',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          int totalAmount = cartController.cartItems.fold(
            0,
                (sum, item) => sum + (int.parse(item.product.price) * item.quantity),
          );

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemCount: cartController.cartItems.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final cartItem = cartController.cartItems[index];
                    return OrderSummaryTile(cartItem: cartItem);
                  },
                ),
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 8,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Total Amount: \$${totalAmount}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        cartController.orders.add({
                          'items': cartController.cartItems.map((item) => {
                            'name': item.product.product_name,
                            'price': item.product.price,
                            'quantity': item.quantity,
                          }).toList(),
                          'total': totalAmount,
                          'timestamp': DateTime.now(),
                        });

                        cartController.clearCart();

                        Get.offAllNamed('/order-status', arguments: {'isSuccess': true});
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Place Order',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      );
    }
  }
