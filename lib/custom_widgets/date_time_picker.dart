import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_ui_project/resources/barrel_const.dart';
import 'package:sample_ui_project/configs/size_config.dart';

import 'primary_button.dart';

void showModalDateTimePicker(
    {required BuildContext context,
    required Function(DateTime) selectedDate,
    required String currentDate,
    int minimumYear = 1900,
    int maximumYear = 2100,
    DateTime? maximumDate}) {
  var currentDateTime = DateTime.now();
  if (currentDate != '') {
    currentDateTime = DateFormat('dd/MM/yyyy').parse(currentDate);
  }

  showModalBottomSheet(
    isScrollControlled: false,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12))),
    backgroundColor: Colors.white,
    context: context,
    builder: (context) => SizedBox(
      height: 350,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: COLOR_CONST.athensGray,
                  width: 1,
                ),
              ),
            ),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  alignment: Alignment.center,
                  child: Text(
                    "select_date".tr(),
                    style: FONT_CONST.regular(
                        color: COLOR_CONST.silverChalice, fontSize: 16),
                  ),
                ),
                Positioned(
                  child: CupertinoButton(
                      padding: const EdgeInsets.all(20),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        ICON_CONST.icClose.path,
                        width: 12,
                      )),
                )
              ],
            )),
        Flexible(
          child: CupertinoDatePicker(
            initialDateTime: currentDateTime,
            onDateTimeChanged: (DateTime newdate) {
              currentDateTime = newdate;
            },
            minimumYear: minimumYear,
            maximumYear: maximumYear,
            mode: CupertinoDatePickerMode.date,
            maximumDate: maximumDate,
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left: appDefaultPadding * 2,
            right: appDefaultPadding * 2,
            bottom: SizeConfig.paddingBottom > 0
                ? SizeConfig.paddingBottom
                : appDefaultPadding,
          ),
          child: PrimaryButton(
            height: getProportionateScreenHeight(60),
            title: 'done'.tr(),
            onPressed: () {
              selectedDate(currentDateTime);
              Navigator.pop(context);
            },
          ),
        ),
      ]),
    ),
  );
}
