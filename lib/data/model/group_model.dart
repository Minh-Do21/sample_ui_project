import 'package:equatable/equatable.dart';
import 'package:g_json/g_json.dart';

class GroupModel extends Equatable {
  final int id;
  final String name;
  final String image;

  const GroupModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory GroupModel.fromJson(JSON json) {
    return GroupModel(
      id: json['id'].integerValue,
      name: json['name'].stringValue,
      image: json['image'].stringValue,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        image,
      ];
}
