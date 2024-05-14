class RegisterNotificationParam {
  final String name;
  final String registrationId;
  final String deviceId;
  final bool active;
  final String type;

  RegisterNotificationParam({
    required this.name,
    required this.registrationId,
    required this.deviceId,
    required this.active,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['registration_id'] = registrationId;
    data['device_id'] = deviceId;
    data['active'] = active;
    data['type'] = type;
    return data;
  }
}
