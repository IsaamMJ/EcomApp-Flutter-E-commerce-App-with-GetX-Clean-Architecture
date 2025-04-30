import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/main_navigation_controller.dart';
import '../pages/home.dart';
import '../pages/cart_page.dart';
import 'orders_screen.dart';

class MainNavigationScreen extends StatelessWidget {
  MainNavigationScreen({Key? key}) : super(key: key);

  final MainNavigationController navCtrl = Get.find<MainNavigationController>();

  final List<Widget> pages = [
    const HomeScreen(),
    const CartScreen(),
    const OrdersScreen(),
  ];

  final List<BottomNavigationBarItem> bottomNavItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
    BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Orders'),
  ];

  final List<String> titles = ['Home', 'Cart', 'Orders'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(titles[navCtrl.selectedIndex.value])),
        centerTitle: true,
      ),
      body: Obx(() => pages[navCtrl.selectedIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: navCtrl.selectedIndex.value,
        onTap: navCtrl.changeTab,
        items: bottomNavItems,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      )),
    );
  }
}
