class ChangePasswordParam {
  final String oldPassword;
  final String newPassword;

  ChangePasswordParam({
    required this.oldPassword,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['old_password'] = oldPassword;
    data['new_password'] = newPassword;
    return data;
  }
}
