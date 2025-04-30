import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      body: Obx(() {
        if (cartController.orders.isEmpty) {
          return const Center(
            child: Text("No orders placed yet.", style: TextStyle(fontSize: 16)),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: cartController.orders.length,
          itemBuilder: (context, index) {
            final order = cartController.orders[index];
            final List<dynamic> items = order['items'];
            final int total = order['total'];
            final DateTime date = order['timestamp'];

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order #${index + 1}",
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Placed on: ${date.toLocal().toString().split('.')[0]}",
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: items.map((item) {
                        return Text(
                          "• ${item['name']} x${item['quantity']} - \$${item['price']}",
                          style: const TextStyle(fontSize: 14),
                        );
                      }).toList(),
                    ),
                    const Divider(height: 20),
                    Text(
                      "Total: \$${total}",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
