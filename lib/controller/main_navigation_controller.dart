import 'package:get/get.dart';

class MainNavigationController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }
  void resetTab() {
    selectedIndex.value = 0;
  }
}