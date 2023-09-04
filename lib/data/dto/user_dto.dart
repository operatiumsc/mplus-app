import 'package:mplus_app/domain/entities/user.dart';

class UserDTO {
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

  UserDTO({
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

  factory UserDTO.fromJson(Map<String, dynamic> json) => UserDTO(
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

extension UserMapper on UserDTO {
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
