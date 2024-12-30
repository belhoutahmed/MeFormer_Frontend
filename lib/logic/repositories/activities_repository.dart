import 'package:dio/dio.dart';

class ActivitiesRepository {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: 'http://192.168.90.210:8000'),
  );

  /// Récupère l'historique des activités d'un étudiant
  Future<List<dynamic>> fetchActivities(String studentId) async {
    try {
      final response = await _dio.get('/activities/$studentId');
      if (response.statusCode == 200) {
        return response.data as List<dynamic>;
      } else {
        throw Exception('Failed to fetch activities');
      }
    } catch (e) {
      throw Exception('Error while fetching activities: $e');
    }
  }

  /// Ajoute une nouvelle activité pour un étudiant
  Future<void> addActivity(String studentId, Map<String, dynamic> activity) async {
    try {
      final response = await _dio.post('/activities/$studentId', data: activity);
      if (response.statusCode != 200) {
        throw Exception('Failed to add activity');
      }
    } catch (e) {
      throw Exception('Error while adding activity: $e');
    }
  }
}
