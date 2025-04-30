import 'package:get/get.dart';
import '../domain/entities/api_data_entities.dart';
import '../domain/usecases/FetchApiDataUseCase.dart';

class HomeController extends GetxController {
  final FetchApiDataUseCase _useCase;

  HomeController(this._useCase);

  final items = <ApiDataEntity>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      isLoading(true);
      final result = await _useCase();
      items.assignAll(result);
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch data");
    } finally {
      isLoading(false);
    }
  }
}
