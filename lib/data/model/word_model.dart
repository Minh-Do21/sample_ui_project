import 'package:equatable/equatable.dart';
import 'package:g_json/g_json.dart';

class WordModel extends Equatable {
  final int id;
  final String name;
  final int group;
  final String? translation;
  final String? spelling;
  final String? image;
  final String? audio;

  const WordModel({
    required this.id,
    required this.name,
    required this.group,
    this.translation,
    this.spelling,
    this.image,
    this.audio,
  });

  factory WordModel.fromJson(JSON json) {
    return WordModel(
      id: json['id'].integerValue,
      name: json['name'].stringValue,
      group: json['group'].integerValue,
      translation: json['translation'].stringValue,
      spelling: json['spelling'].stringValue,
      audio: json['audio'].stringValue,
      image: json['image'].stringValue,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['group'] = group;
    data['translation'] = image;
    data['spelling'] = image;
    data['audio'] = image;
    data['image'] = image;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        group,
        translation,
        spelling,
        image,
        audio,
      ];
}
