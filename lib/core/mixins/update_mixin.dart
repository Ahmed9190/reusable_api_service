import 'package:flutter/foundation.dart';
import 'package:reusable_api_service/api_service.dart';
import 'package:reusable_api_service/models/json_convertible_model.dart';

mixin UpdateMixin<RetrieveModel extends JsonConvertibleModel,
    CreateUpdateModel extends JsonConvertibleModel> {
  @protected
  ApiService<RetrieveModel, CreateUpdateModel> get apiService;
  @protected
  String get endpoint;

  Future<RetrieveModel> update(
      {required int id, required CreateUpdateModel body}) {
    return apiService.update(endpoint, id: id, body: body);
  }
}
