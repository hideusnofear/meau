class Credential {
  final String accessToken;
  final String tokenType;
  final int expiresIn;

  Credential({this.accessToken, this.tokenType, this.expiresIn});

  factory Credential.fromJson(Map<String, dynamic> json) {
    return Credential(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      expiresIn: json['expires_in'],
    );
  }
}
