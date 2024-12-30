import 'package:dio/dio.dart';

class ArticlesRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://192.168.90.210:8000'));

  Future<List<dynamic>> fetchArticles({String? category}) async {
    final response = await _dio.get('/articles');
    return response.data;
  }
}
