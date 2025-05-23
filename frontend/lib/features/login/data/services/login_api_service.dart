import 'package:dio/dio.dart';
import '../models/login_response.dart';

class LoginApiService {
  final Dio _dio;

  LoginApiService(this._dio);

  Future<LoginResponse> login(String username, String password) async {
    try {
      final response = await _dio.post(
        '/users/login',
        data: {
          'email': username,
          'password': password,
        },
      );
      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }

  String _handleDioError(DioException e) {
    if (e.response != null) {
      if (e.response?.statusCode == 404) {
        return 'Incorrect credentials';
      } else {
        return 'internal Server error}';
      }
    } else {
      return 'Network error: ${e.message}';
    }
  }
}
