import 'package:mplus_app/app/user/domain/entities/user.dart';

class UserModel {
  String? uuid;
  String? email;
  String? name;
  String? avatar;
  String? type;
  String? typeRefId;
  String? subType;
  String? subTypeRefId;
  String? passwordLastUpdatedAt;
  String? accessToken;
  String? refreshToken;

  UserModel({
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

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uuid: json["uuid"],
        email: json["email"],
        name: json["name"],
        avatar: json["avatar"],
        type: json["type"],
        typeRefId: json["typeRefId"],
        subType: json["subType"],
        subTypeRefId: json["subTypeRefId"],
        passwordLastUpdatedAt: json["passwordLastUpdatedAt"],
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "email": email,
        "name": name,
        "avatar": avatar,
        "type": type,
        "typeRefId": typeRefId,
        "subType": subType,
        "subTypeRefId": subTypeRefId,
        "passwordLastUpdatedAt": passwordLastUpdatedAt,
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}

extension UserMapper on UserModel {
  User toEntity() => User(
        uuid: uuid,
        email: email,
        name: name,
        avatar: avatar,
        type: type,
        typeRefId: typeRefId,
        subType: subType,
        subTypeRefId: subTypeRefId,
        passwordLastUpdatedAt: DateTime.tryParse(passwordLastUpdatedAt ?? ''),
      );
}
