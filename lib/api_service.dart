import 'package:dio/dio.dart';
import 'package:reusable_api_service/models/json_convertible_model.dart';

class ApiService<RetrieveModel,
    CreateUpdateModel extends JsonConvertibleModel> {
  final Dio _dio;
  final String _baseUrl;
  final RetrieveModel Function(Map<String, dynamic>) _fromJson;

  const ApiService({
    required Dio dio,
    String baseUrl = "https://jsonplaceholder.typicode.com",
    required RetrieveModel Function(Map<String, dynamic>) fromJson,
  })  : _baseUrl = baseUrl,
        _dio = dio,
        _fromJson = fromJson;

  Future<List<RetrieveModel>> getAll(
    String endpoint, {
    int? page,
    int? limit,
  }) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/$endpoint',
        queryParameters: {
          if (page != null) 'page': page,
          if (limit != null) 'limit': limit,
        },
      );

      final data = response.data as List;
      return data
          .map((item) => _fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<RetrieveModel> getById(
    String endpoint,
    int id,
  ) async {
    try {
      final response = await _dio.get('$_baseUrl/$endpoint/$id');
      return _fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<RetrieveModel> create(
    String endpoint,
    CreateUpdateModel body,
  ) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/$endpoint',
        data: body.toJson(),
      );
      return _fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<RetrieveModel> update(
    String endpoint, {
    required int id,
    required JsonConvertibleModel body,
  }) async {
    try {
      final response = await _dio.put(
        '$_baseUrl/$endpoint/$id',
        data: body.toJson(),
      );
      return _fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<void> delete(String endpoint, int id) async {
    try {
      await _dio.delete('$_baseUrl/$endpoint/$id');
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  void _handleError(Object e) {
    if (e is DioException) {
      print("DioError: ${e.response?.data ?? e.message}");
    } else {
      print("Unexpected error: $e");
    }
  }
}
