class SearchMapsParam {
  final String input;
  final String key;
  final String sessionToken;

  SearchMapsParam({
    required this.input,
    required this.key,
    required this.sessionToken,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['input'] = input;
    data['key'] = key;
    data['sessiontoken'] = sessionToken;
    return data;
  }
}
