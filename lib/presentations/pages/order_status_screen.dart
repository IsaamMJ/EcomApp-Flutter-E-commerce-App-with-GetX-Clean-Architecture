import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/main_navigation_controller.dart';
import 'main_navigation.dart';

class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final bool isSuccess = Get.arguments['isSuccess'] ?? true;

    return Scaffold(
      backgroundColor: isSuccess ? Colors.green[50] : Colors.red[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSuccess ? Icons.check_circle_outline : Icons.error_outline,
              size: 100,
              color: isSuccess ? Colors.green : Colors.red,
            ),
            const SizedBox(height: 20),
            Text(
              isSuccess ? "Order Placed Successfully!" : "Order Failed!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: isSuccess ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              isSuccess
                  ? "Thank you for shopping with us."
                  : "Please try again later.",
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                final navCtrl = Get.find<MainNavigationController>();
                navCtrl.resetTab();
                Get.offAll(() => MainNavigationScreen());
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Continue Shopping',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
