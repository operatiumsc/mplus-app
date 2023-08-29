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
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        uuid: json["uuid"],
        email: json["email"],
        name: json["name"],
        avatar: json["avatar"],
        type: json["type"],
        typeRefId: json["typeRefId"],
        subType: json["subType"],
        subTypeRefId: json["subTypeRefId"],
        passwordLastUpdatedAt: DateTime.tryParse(json["passwordLastUpdatedAt"]),
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
        "passwordLastUpdatedAt": passwordLastUpdatedAt?.toIso8601String(),
      };
}
