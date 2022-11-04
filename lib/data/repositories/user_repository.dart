import 'package:dio/dio.dart';
import 'package:test_task_makeit/data/api_cleint/exeption_api_client.dart';
import 'package:test_task_makeit/data/api_cleint/network_api.dart';
import 'package:test_task_makeit/data/models/persons.dart';

class UserRepositories {
  final NetworkClient apiClient = NetworkClient(Dio());

  Future<List<PersonEntity>> getPersonsApi() async {
    try {
      final response = await apiClient.get(Endpoints.users);
      final users =
          (response.data as List).map((e) => PersonEntity.fromJson(e)).toList();
      return users;
    } on DioError catch (e) {
      final errorMessage = ApiExceptions.fromDioError(e);
      throw errorMessage;
    }
  }
}
