import 'package:ecomapp/domain/entities/api_data_entities.dart';
import 'package:ecomapp/domain/repositories/api_repositories.dart';

class FetchApiDataUseCase {
  final ApiRepository repository;

  FetchApiDataUseCase(this.repository);

  Future<List<ApiDataEntity>> call() => repository.fetchData();
}
