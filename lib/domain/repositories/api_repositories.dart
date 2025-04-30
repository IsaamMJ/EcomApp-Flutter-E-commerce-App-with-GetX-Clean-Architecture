import 'package:ecomapp/domain/entities/api_data_entities.dart';

abstract class ApiRepository {
  Future<List<ApiDataEntity>> fetchData();
}
