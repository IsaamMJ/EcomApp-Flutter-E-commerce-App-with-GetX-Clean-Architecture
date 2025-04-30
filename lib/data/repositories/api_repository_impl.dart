import 'package:ecomapp/domain/entities/api_data_entities.dart';
import 'package:ecomapp/domain/repositories/api_repositories.dart';
import '../datasources/api_remote_datasource.dart';

class ApiRepositoryImpl implements ApiRepository {
  final ApiRemoteDatasource remoteDatasource;

  ApiRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<ApiDataEntity>> fetchData() {
    return remoteDatasource.fetchApiData();
  }
}
