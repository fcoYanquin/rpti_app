class Login {
  final String accessToken;
  final String tokenType;
  final DateTime expiresAt;

  Login({
    required this.accessToken,
    required this.tokenType,
    required this.expiresAt,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresAt: DateTime.parse(json["expires_at"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_at": expiresAt.toIso8601String(),
      };
}
