const String demoQuery = """
mutation SendOtp(\$input: VerifyOtpInput!) {
  verifyOtp(input: \$input) {
    accessToken
    expiresIn

  }
}
""";

class OrderDetailMutation {}
