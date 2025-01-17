import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reusable_api_service/models/json_convertible_model.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

@freezed
class TodoModel with _$TodoModel {
  @Implements<JsonConvertibleModel>()
  factory TodoModel({
    required int id,
    required int userId,
    required String title,
    required bool completed,
  }) = _TodoModel;

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);
}

@freezed
class CreateUpdateTodoModel
    with _$CreateUpdateTodoModel
    implements JsonConvertibleModel {
  @Implements<JsonConvertibleModel>()
  factory CreateUpdateTodoModel({
    required int userId,
    required String title,
    required bool completed,
  }) = _CreateUpdateTodoModel;

  factory CreateUpdateTodoModel.fromRetrieveModel(TodoModel model) =>
      CreateUpdateTodoModel(
        userId: model.userId,
        title: model.title,
        completed: model.completed,
      );

  factory CreateUpdateTodoModel.fromJson(Map<String, dynamic> json) =>
      _$CreateUpdateTodoModelFromJson(json);
}
