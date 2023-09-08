import 'package:mplus_app/core/user/data/models/user_model.dart';

class User {
  String? uuid;
  String? email;
  String? name;
  String? avatar;
  String? type;
  String? typeRefId;
  String? subType;
  String? subTypeRefId;
  DateTime? passwordLastUpdatedAt;
  String? accessToken;
  String? refreshToken;

  User({
    this.uuid,
    this.email,
    this.name,
    this.avatar,
    this.type,
    this.typeRefId,
    this.subType,
    this.subTypeRefId,
    this.passwordLastUpdatedAt,
    this.accessToken,
    this.refreshToken,
  });
}

extension UserMapper on User {
  UserModel toModel() => UserModel(
        uuid: uuid,
        email: email,
        name: name,
        avatar: avatar,
        type: type,
        typeRefId: typeRefId,
        subType: subType,
        subTypeRefId: subTypeRefId,
        passwordLastUpdatedAt: passwordLastUpdatedAt?.toIso8601String(),
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
}
