class PhoneNumberCheckSignUpParam{
  final String phoneNumber;
  final String phoneCode;

  PhoneNumberCheckSignUpParam({
    required this.phoneNumber,
    required this.phoneCode,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['phone_number'] = phoneNumber;
    data['phone_code'] = phoneCode;
    return data;
  }
}