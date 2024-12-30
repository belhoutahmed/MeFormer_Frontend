import 'package:dio/dio.dart';

class StudentAuthRepository {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: 'http://192.168.90.210:8000'),
  );

  Future<String> login(String email, String password) async {
    final response = await _dio.post(
      '/student/login',
      data: {'email': email, 'password': password},
    );
    return response.data['access_token'];
  }

  Future<void> register(Map<String, dynamic> studentData) async {
    await _dio.post('/student/register', data: studentData);
  }
}
