class ValidateOTPForgotPassParams {
  final String phoneCode;
  final String phoneNumber;
  final String sessionInfo;
  final String code;

  ValidateOTPForgotPassParams({
    required this.phoneCode,
    required this.phoneNumber,
    required this.sessionInfo,
    required this.code,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['phone_code'] = phoneCode;
    data['phone_number'] = phoneNumber;
    data['session_info'] = sessionInfo;
    data['code'] = code;
    return data;
  }
}
