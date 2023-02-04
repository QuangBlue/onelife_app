const String popularCategoryQuery = """
query PopularCategory {
  popularCategory {
    name
  }
}
""";

const String sendOtpMutation = """
mutation SendOtp(\$input: SendOtpInput!) {
  sendOtp(input: \$input) {
    expiresIn
    forceSecurityCheck
    otpTrackingId
  }
}
""";
