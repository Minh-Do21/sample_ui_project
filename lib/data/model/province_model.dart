import 'commune_model.dart';
import 'district_model.dart';

class ProvinceModel {
  final int index;
  final String name;
  final List<DistrictModel> listDistrict;

  ProvinceModel({
    required this.index,
    required this.name,
    required this.listDistrict,
  });

  static List<ProvinceModel> getList(){
    return [
      ProvinceModel(
        index: 1,
        name: "Tỉnh Yên Bái",
        listDistrict: [
          DistrictModel(
            index: 1,
            name: "Huyện Yên Bình",
            listCommune: [
              CommuneModel(index: 1, name: "Xã Đại Đồng", isSelected: false),
              CommuneModel(index: 2, name: "Xã Đồng Đao", isSelected: false),
              CommuneModel(index: 3, name: "Xã Cẩm Ân", isSelected: false),
              CommuneModel(index: 4, name: "Xã Vũ Linh", isSelected: false),
              CommuneModel(index: 5, name: "Xã Thác Bà", isSelected: false),
              CommuneModel(index: 6, name: "Xã Nghĩa Tân", isSelected: false),
            ]
          ),
          DistrictModel(
            index: 2,
            name: "Huyện Lục Yên",
            listCommune: [
              CommuneModel(index: 1, name: "Xã Yên Thế", isSelected: false),
              CommuneModel(index: 2, name: "Xã An Lạc", isSelected: false),
              CommuneModel(index: 3, name: "Xã An Phú", isSelected: false),
              CommuneModel(index: 4, name: "Xã Phan Thanh", isSelected: false),
              CommuneModel(index: 5, name: "Xã Phúc Lợi", isSelected: false),
              CommuneModel(index: 6, name: "Xã Động Quan", isSelected: false),
            ]
          )
        ]
      ),

      ProvinceModel(
        index: 1,
        name: "Tỉnh Phú Thọ",
        listDistrict: [
          DistrictModel(
            index: 1,
            name: "Huyện Đoan Hùng",
            listCommune: [
              CommuneModel(index: 1, name: "Xã Đại Đồng 1", isSelected: false),
              CommuneModel(index: 2, name: "Xã Đồng Đao 2", isSelected: false),
              CommuneModel(index: 3, name: "Xã Cẩm Ân 3", isSelected: false),
              CommuneModel(index: 4, name: "Xã Vũ Linh 4", isSelected: false),
              CommuneModel(index: 5, name: "Xã Thác Bà 5", isSelected: false),
              CommuneModel(index: 6, name: "Xã Nghĩa Tân 6", isSelected: false),
            ]
          ),
          DistrictModel(
            index: 2,
            name: "Huyện Hạ Hoà",
            listCommune: [
              CommuneModel(index: 1, name: "Xã Yên Thế 1", isSelected: false),
              CommuneModel(index: 2, name: "Xã An Lạc 2", isSelected: false),
              CommuneModel(index: 3, name: "Xã An Phú 3", isSelected: false),
              CommuneModel(index: 4, name: "Xã Phan Thanh 4", isSelected: false),
              CommuneModel(index: 5, name: "Xã Phúc Lợi 5", isSelected: false),
              CommuneModel(index: 6, name: "Xã Động Quan 6", isSelected: false),
            ]
          )
        ]
      ),
    ];
  }
}