import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../../controller/home_controller.dart';
import '../../controller/main_navigation_controller.dart';
import '../../data/datasources/api_remote_datasource.dart';
import '../../data/repositories/api_repository_impl.dart';
import '../../domain/usecases/FetchApiDataUseCase.dart';
import '../../domain/repositories/api_repositories.dart';

class MainNavigationBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MainNavigationController(), permanent: true);
    Get.put(CartController(), permanent: true);

    Get.lazyPut<ApiRemoteDatasource>(() => ApiRemoteDatasource());
    Get.lazyPut<ApiRepository>(() => ApiRepositoryImpl(Get.find()));
    Get.lazyPut<FetchApiDataUseCase>(() => FetchApiDataUseCase(Get.find()));

    Get.put<HomeController>(HomeController(Get.find()), permanent: true);
  }
}
