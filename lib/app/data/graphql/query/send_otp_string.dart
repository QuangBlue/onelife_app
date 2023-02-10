const String sendOtpMutation = """
mutation SendOtp(\$input: SendOtpInput!) {
  sendOtp(input: \$input) {
    expiresIn
    forceSecurityCheck
    otpTrackingId
  }
}
""";
