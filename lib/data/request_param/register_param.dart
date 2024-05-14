class RegisterParams {
  final String phoneCode;
  final String phoneNumber;
  final String fullName;
  final String email;
  final String password;
  final String sessionInfo;
  final String code;

  RegisterParams({
    required this.phoneCode,
    required this.phoneNumber,
    required this.fullName,
    required this.email,
    required this.password,
    required this.sessionInfo,
    required this.code,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['phone_code'] = phoneCode;
    data['phone_number'] = phoneNumber;
    data['fullname'] = fullName;
    data['email'] = email;
    data['password'] = password;
    data['session_info'] = sessionInfo;
    data['code'] = code;
    return data;
  }
}
