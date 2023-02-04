class SendOtp {
  int? expiresIn;
  bool? forceSecurityCheck;
  String? otpTrackingId;

  SendOtp({this.expiresIn, this.forceSecurityCheck, this.otpTrackingId});

  SendOtp.fromJson(Map<String, dynamic> json) {
    expiresIn = json['expiresIn'];
    forceSecurityCheck = json['forceSecurityCheck'];
    otpTrackingId = json['otpTrackingId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expiresIn'] = expiresIn;
    data['forceSecurityCheck'] = forceSecurityCheck;
    data['otpTrackingId'] = otpTrackingId;
    return data;
  }
}
