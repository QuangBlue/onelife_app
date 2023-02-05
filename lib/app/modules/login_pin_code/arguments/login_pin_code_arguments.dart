import 'package:onelife_app/app/data/models/send_otp_model.dart';

class LoginPinCodeArguments {
  LoginPinCodeArguments({required this.sendOtp, required this.phoneNumber});

  final SendOtpModel sendOtp;
  final String phoneNumber;
}
