class ResetPasswordParam {
  final String phoneCode;
  final String phoneNumber;
  final String tokenForgotPass;
  final String newPassword;

  ResetPasswordParam({
    required this.phoneCode,
    required this.phoneNumber,
    required this.tokenForgotPass,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['phone_code'] = phoneCode;
    data['phone_number'] = phoneNumber;
    data['token_forgot_pass'] = tokenForgotPass;
    data['new_password'] = newPassword;
    return data;
  }
}
