import 'package:dio/dio.dart';
import '../model/api_data_model.dart';

class ApiRemoteDatasource {
  final Dio _dio = Dio();

  Future<List<ApiDataModel>> fetchApiData() async {
    final response = await _dio.get('https://mocki.io/v1/7f290bc1-08ea-4f75-a134-21229d3adb78');
    final dataList = response.data['data'] as List;
    return dataList.map((e) => ApiDataModel.fromJson(e)).toList();
  }
}
