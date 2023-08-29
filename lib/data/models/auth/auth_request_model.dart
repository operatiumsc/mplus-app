class AuthRequest {
  String? username;
  String? password;

      AuthRequest({
        this.username,
        this.password,
    });

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
    };
}
