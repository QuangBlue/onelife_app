class VerifyOtpInputModel {
  String? accessToken;
  int? expiresIn;
  String? refreshToken;
  String? tokenType;

  VerifyOtpInputModel(
      {this.accessToken, this.expiresIn, this.refreshToken, this.tokenType});

  VerifyOtpInputModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    expiresIn = json['expiresIn'];
    refreshToken = json['refreshToken'];
    tokenType = json['tokenType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['expiresIn'] = expiresIn;
    data['refreshToken'] = refreshToken;
    data['tokenType'] = tokenType;
    return data;
  }
}
