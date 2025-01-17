import 'package:flutter/foundation.dart';
import 'package:reusable_api_service/api_service.dart';
import 'package:reusable_api_service/models/json_convertible_model.dart';

mixin GetAllMixin<RetrieveModel,
    CreateUpdateModel extends JsonConvertibleModel> {
  @protected
  ApiService<RetrieveModel, CreateUpdateModel> get apiService;
  @protected
  String get endpoint;

  Future<List<RetrieveModel>> getAll({int? page, int? limit}) {
    return apiService.getAll(endpoint, page: page, limit: limit);
  }
}
