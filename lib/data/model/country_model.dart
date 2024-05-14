import 'package:g_json/g_json.dart';

class CountryModel {
  final int id;
  final String countryCode;
  final String countryName;
  final String phoneCode;

  const CountryModel({
    required this.id,
    required this.countryCode,
    required this.countryName,
    required this.phoneCode,
  });

  factory CountryModel.fromJson(JSON json) {
    return CountryModel(
      id: json['id'].integerValue,
      countryCode: json['country_code'].stringValue,
      countryName: json['country_name'].stringValue,
      phoneCode: json['phone_code'].stringValue,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['country_code'] = countryCode;
    data['country_name'] = countryName;
    data['phone_code'] = phoneCode;
    return data;
  }
}