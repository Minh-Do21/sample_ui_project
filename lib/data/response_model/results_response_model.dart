import 'package:g_json/g_json.dart';

class ResultsResponseModel<T> {
  int count;
  int? next;
  int? previous;
  List<T>? results;

  ResultsResponseModel({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory ResultsResponseModel.fromJson(JSON json, Function fromJsonModel) {
    return ResultsResponseModel(
      count: json['count'].integerValue,
      next: json['next'].integerValue,
      previous: json['previous'].integerValue,
      results: List<T>.from(json['results']
          .listValue
          .map((itemsJson) => fromJsonModel(itemsJson))
          .toList()),
    );
  }
}
