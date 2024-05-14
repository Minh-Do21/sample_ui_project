class LoginParams {
  final String phoneCode;
  final String phoneNumber;
  final String password;

  LoginParams({
    required this.phoneCode,
    required this.phoneNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["phone_code"] = phoneCode;
    data['phone_number'] = phoneNumber;
    data['password'] = password;
    return data;
  }
}
