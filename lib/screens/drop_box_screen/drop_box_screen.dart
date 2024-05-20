import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sample_ui_project/custom_widgets/drop_box_custom.dart';
import 'package:sample_ui_project/data/model/province_model.dart';
import '../../resources/barrel_const.dart';

class DropBoxScreen extends StatefulWidget{
  const DropBoxScreen({super.key});

  @override
  State<DropBoxScreen> createState() => _DropBoxScreenState();
}

class _DropBoxScreenState extends State<DropBoxScreen> {
  @override
  Widget build(BuildContext context) {

    final listCommune = ProvinceModel.getList().first.listDistrict.first.listCommune;

    final dropdownDatas = listCommune
        .map((item) => ItemDataDropdown(
                index: item.index.toString(),
                title: item.name,
                object: item,
              ))
          .toList();

     // ignore: sdk_version_since
     ItemDataDropdown? dataSelected = dropdownDatas.where((item) => item.index == 1.toString()).firstOrNull;

    return Scaffold(
      backgroundColor: COLOR_CONST.white,
      appBar: AppBar(
        backgroundColor: COLOR_CONST.cornflowerBlue,
        title: const Text("Drop Box"),
      ),
      body: Column(
        children: [
          const Gap(40),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20
            ),
            child: DropBoxCustom(
              label: 'Xã',
              dataList: dropdownDatas,
              dataInit: dataSelected,
              dataSelected: (value) {
               
              },
              lableStyle:  FONT_CONST.bold(
                color: COLOR_CONST.black, fontSize: 12
              ),
              height: 44,
              paddingItem: const EdgeInsets.all(8),
              borderRadius: BorderRadius.circular(40),
              hintText: "Chọn xã của bạn",
              // iconWidget: Row(
              //   children: [
              //     Icon(Icons.keyboard_arrow_down_outlined)
              //   ],
              // ),
              backgroundColor: COLOR_CONST.white,
            ),
          ),
        ],
      ),
    );
  }
}