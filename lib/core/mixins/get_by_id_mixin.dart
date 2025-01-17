import 'package:flutter/foundation.dart';
import 'package:reusable_api_service/api_service.dart';
import 'package:reusable_api_service/models/json_convertible_model.dart';

mixin GetByIdMixin<RetrieveModel,
    CreateUpdateModel extends JsonConvertibleModel> {
  @protected
  ApiService<RetrieveModel, CreateUpdateModel> get apiService;
  @protected
  String get endpoint;

  Future<RetrieveModel> getById(int id) {
    return apiService.getById(endpoint, id);
  }
}
