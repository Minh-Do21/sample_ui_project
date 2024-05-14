class OtpScreenArgument {
  final String nationalCode;
  final String nationalPhoneNumber;
  final String fullName;
  final String email;
  final String password;
  final String routeName;
  final bool isUpdateProfile;

  OtpScreenArgument({
    required this.nationalCode,
    required this.nationalPhoneNumber,
    required this.fullName,
    required this.email,
    required this.password,
    required this.routeName,
    required this.isUpdateProfile,
  });
}