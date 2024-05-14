class ReadNotificationParam {
  final int notificationId;

  ReadNotificationParam({required this.notificationId});

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['notification_id'] = notificationId;
    return data;
  }
}
