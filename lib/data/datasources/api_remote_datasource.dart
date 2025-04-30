import 'package:dio/dio.dart';
import '../model/api_data_model.dart';

class ApiRemoteDatasource {
  final Dio _dio = Dio();

  Future<List<ApiDataModel>> fetchApiData() async {
    final response = await _dio.get('https://mocki.io/v1/770c86fa-0434-4555-a5e9-17486a5ede7c');
    final dataList = response.data['data'] as List;
    return dataList.map((e) => ApiDataModel.fromJson(e)).toList();
  }
}
