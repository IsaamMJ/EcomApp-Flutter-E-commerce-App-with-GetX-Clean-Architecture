import 'package:get/get.dart';
import '../presentations/pages/order_status_screen.dart';
import '../routes/app_routes.dart';
import '../presentations/pages/main_navigation.dart';
import '../presentations/pages/order_summary_screen.dart';
import '../presentations/bindings/main_navigation_bindings.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.main,
      page: () => MainNavigationScreen(),
      binding: MainNavigationBindings(),
    ),
    GetPage(
      name: AppRoutes.orderSummary,
      page: () => const OrderSummaryScreen(),
    ),
    GetPage(
      name: AppRoutes.orderStatus,
      page: () => const OrderStatusScreen(),
    ),
  ];
}