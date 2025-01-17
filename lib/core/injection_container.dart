import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:reusable_api_service/api_service.dart';
import 'package:reusable_api_service/models/json_convertible_model.dart';
import 'package:reusable_api_service/models/todo_model.dart';
import 'package:reusable_api_service/models/user_model.dart';
import 'package:reusable_api_service/resource_api_service.dart';

final sl = GetIt.instance;
void initInjection() {
  sl.registerLazySingleton(() => Dio());

  injectDataSource<UserModel, CreateUpdateUserModel>(
    fromJson: UserModel.fromJson,
    endpoint: "/users",
  );
  // todo
  injectDataSource<TodoModel, CreateUpdateTodoModel>(
    fromJson: TodoModel.fromJson,
    endpoint: "/todos",
  );
}

void injectDataSource<RetrieveModel extends JsonConvertibleModel,
    CreateUpdateUserModel extends JsonConvertibleModel>({
  required RetrieveModel Function(Map<String, dynamic>) fromJson,
  required String endpoint,
}) {
  sl.registerLazySingleton(
    () => ApiService<RetrieveModel, CreateUpdateUserModel>(
      dio: sl(),
      fromJson: fromJson,
    ),
  );

  sl.registerLazySingleton(
    () => ResourceApiService<RetrieveModel, CreateUpdateUserModel>(
      endpoint: endpoint,
      apiService: sl(),
    ),
  );
}
