const String verifyOtpInputMutation = """
mutation SendOtp(\$input: VerifyOtpInput!) {
  verifyOtp(input: \$input) {
    accessToken
    expiresIn
    refreshToken
    tokenType
  }
}
""";
