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
