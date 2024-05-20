import 'commune_model.dart';

class DistrictModel {
  final int index;
  final String name;
  final List<CommuneModel> listCommune;

  DistrictModel({
    required this.index,
    required this.name,
    required this.listCommune,
  });
}