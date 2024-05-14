class ServiceParam {
  final int? spaId;
  final String date;

  ServiceParam({
    this.spaId,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (spaId != null) data['spa_id'] = spaId;
    data['date'] = date;
    return data;
  }
}
