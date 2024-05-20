import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../data/model/commune_model.dart';
import '../../data/model/province_model.dart';
import '../../resources/color_const.dart';
import 'item_expansion.dart';
import 'item_filter_chip.dart';

class ExpansionPanelScreen extends StatefulWidget{
  const ExpansionPanelScreen({super.key});

  @override
  State<StatefulWidget> createState() => ExpansionPanelFormScreen();
  
}

class ExpansionPanelFormScreen extends State<ExpansionPanelScreen>{

  final listSelected = <CommuneModel>[];

  final ValueNotifier<bool> isUpdateData = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {

    final listProvince = ProvinceModel.getList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: COLOR_CONST.cornflowerBlue,
        title: const Text("Expansion Panel"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Xã đã chọn"),
            const Gap(10),
            Align(
              alignment: Alignment.topLeft,
              child: ValueListenableBuilder<bool>(
                valueListenable: isUpdateData,
                builder: (BuildContext context, bool value, Widget? child) {
                  return Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(
                      listSelected.length,
                      (index) {
                        return Container(
                          color: Colors.green.shade300,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5
                          ),
                          child: Text(
                            listSelected[index].name,
                            style: const TextStyle(
                              fontSize: 15.0, 
                              fontWeight: FontWeight.w400,
                              color: Colors.black
                            ),
                          ),
                        );
                      }
                    )
                  );
                }
              ),
            ),
            const Gap(20),

            
            Expanded(
              child: ListView.builder(
                itemCount: listProvince.length,
                itemBuilder: (context, index) {
                  
                  final decorationList = ItemExpansion.getDecoration(index, listProvince.length);
                  final listDistrict = listProvince[index].listDistrict;
                  
                  return ItemExpansion(
                    title: Text(
                      listProvince[index].name,
                      style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                    ),
                    decorationBorder: decorationList.first,
                    decorationMain: decorationList.last,
                    children: [
            
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          listDistrict.length,
                          (index) {
            
                            final listCommune = listDistrict[index].listCommune;
            
                            return ItemExpansion(
                              title: Row(
                                children: [
                                  Container(
                                    width: 6,
                                    height: 6,
                                    decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10)
                                      )
                                    ),
                                  ),
                                  const Gap(10),
                                  Text(
                                    listDistrict[index].name,
                                    style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              decorationBorder: const BoxDecoration(),
                              decorationMain: BoxDecoration(
                                color: Colors.grey.shade200,
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.grey.shade400,
                                  )
                                )
                              ),
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                    right: 15,
                                    left: 15,
                                    bottom: 15,
                                  ),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Wrap(
                                      spacing: 10,
                                      runSpacing: 16,
                                      children: List.generate(
                                        listCommune.length,
                                        (index) {
                                          return ItemFilterChip(
                                            title: listCommune[index].name,
                                            isSelected: listCommune[index].isSelected,
                                            onSelected: (value) {

                                              isUpdateData.value = !isUpdateData.value;

                                              if(value){
                                                listSelected.add(listCommune[index]);
                                              }else{
                                                listSelected.remove(listCommune[index]);
                                              }
                                            },
                                          );
                                        }
                                      )
                                    ),
                                  ),
                                ),
                              ]
                            );
                          }
                        ),
                      )
                    ]
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}