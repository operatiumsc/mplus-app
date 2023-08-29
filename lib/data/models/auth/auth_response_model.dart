class AuthResponse {
    String? accessToken;
    String? refreshToken;

    AuthResponse({
        this.accessToken,
        this.refreshToken,
    });

    factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
    );

}