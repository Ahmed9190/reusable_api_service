import 'package:flutter/foundation.dart';
import 'package:reusable_api_service/models/json_convertible_model.dart';
import 'package:reusable_api_service/api_service.dart';

import 'core/mixins/mixins.dart';

class ResourceApiService<RetrieveModel extends JsonConvertibleModel,
        CreateUpdateModel extends JsonConvertibleModel>
    with
        CreateMixin<RetrieveModel, CreateUpdateModel>,
        DeleteMixin<RetrieveModel, CreateUpdateModel>,
        GetAllMixin<RetrieveModel, CreateUpdateModel>,
        GetByIdMixin<RetrieveModel, CreateUpdateModel>,
        UpdateMixin<RetrieveModel, CreateUpdateModel> {
  @protected
  @override
  final String endpoint;
  @protected
  @override
  final ApiService<RetrieveModel, CreateUpdateModel> apiService;

  const ResourceApiService({
    required this.endpoint,
    required this.apiService,
  });
}
