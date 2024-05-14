import 'dart:io';
import 'package:dio/dio.dart';

class CompleteProfileParam {
  final String fullname;
  final String? birthday;
  final String email;
  final int gender;
  final int province;
  final File? avatar;

  CompleteProfileParam({
    required this.fullname,
    this.birthday,
    required this.email,
    required this.gender,
    required this.province,
    this.avatar,
  });

  FormData toFormData() {
    final formData = FormData.fromMap({
      'fullname': fullname,
      if (birthday != null) 'birthday': birthday,
      'email': email,
      'gender': gender,
      'province': province,
      if (avatar != null)
        'avatar': MultipartFile.fromFileSync(avatar!.path),
    });
    return formData;
  }
}
