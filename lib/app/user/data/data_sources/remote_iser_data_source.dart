import 'package:mplus_app/app/user/data/models/user_model.dart';
import 'package:mplus_app/utils/services/rest.dart';

abstract class RemoteUserDataSource {
  Future<UserModel> getUser();
  // Future<bool> changeAvatar();
  // Future<bool> changePassword();
}

class RemoteUserDataSourceImpl implements RemoteUserDataSource {
  final _client = Rest().client;

  @override
  Future<UserModel> getUser() async {
    final response = await _client.get('/user/profile');
    return UserModel.fromJson(response.data);
  }
}
