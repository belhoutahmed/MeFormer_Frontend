import 'package:dio/dio.dart';

class ExercisesRepository {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: "http://192.168.90.210:8000"),
  );

  Future<List<dynamic>> fetchExercises() async {
    try {
      final response = await _dio.get("/exercises");
      return response.data;
    } catch (e) {
      throw Exception("Failed to load exercises: $e");
    }
  }
}
