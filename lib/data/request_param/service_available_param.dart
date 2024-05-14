class ServiceAvailableParam {
  final int serviceId;
  final String dateBooking;

  ServiceAvailableParam({
    required this.serviceId,
    required this.dateBooking,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['service_id'] = serviceId;
    data['date_booking'] = dateBooking;
    return data;
  }
}
