import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reusable_api_service/models/json_convertible_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  @Implements<JsonConvertibleModel>()
  factory UserModel({
    required int id,
    required String username,
    required String email,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
class CreateUpdateUserModel
    with _$CreateUpdateUserModel
    implements JsonConvertibleModel {
  @Implements<JsonConvertibleModel>()
  factory CreateUpdateUserModel({
    required String username,
    required String email,
  }) = _CreateUpdateUserModel;

  factory CreateUpdateUserModel.fromRetrieveModel(UserModel model) =>
      CreateUpdateUserModel(
        username: model.username,
        email: model.email,
      );

  factory CreateUpdateUserModel.fromJson(Map<String, dynamic> json) =>
      _$CreateUpdateUserModelFromJson(json);
}
