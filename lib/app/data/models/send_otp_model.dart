class SendOtpModel {
  int? expiresIn;
  bool? forceSecurityCheck;
  String? otpTrackingId;

  SendOtpModel({this.expiresIn, this.forceSecurityCheck, this.otpTrackingId});

  SendOtpModel.fromJson(Map<String, dynamic> json) {
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
