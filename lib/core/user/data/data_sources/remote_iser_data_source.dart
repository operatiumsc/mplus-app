import 'package:dio/dio.dart';
import 'package:mplus_app/core/user/data/models/user_model.dart';
import 'package:mplus_app/injection.dart';

abstract class RemoteUserDataSource {
  Future<UserModel> getUser();
  // Future<bool> changeAvatar();
  // Future<bool> changePassword();
}

class RemoteUserDataSourceImpl implements RemoteUserDataSource {
  final _dio = service.get<Dio>();

  @override
  Future<UserModel> getUser() async {
    final response = await _dio.get('/user/profile');
    return UserModel.fromJson(response.data);
  }
}
