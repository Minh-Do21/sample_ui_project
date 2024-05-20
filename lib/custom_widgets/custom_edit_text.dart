import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_ui_project/resources/barrel_const.dart';
import 'package:sample_ui_project/configs/size_config.dart';
import 'package:sample_ui_project/utils/utils.dart';

class CustomEditText extends StatelessWidget {
  const CustomEditText({
    required this.title,
    this.width,
    this.height,
    this.boxDecoration,
    this.backgroundColor,
    required this.hint,
    required this.onTextChange,
    this.errorText,
    this.inputType,
    this.textController,
    required this.isRequired,
    this.textInit = '',
  });
  final String title;
  final double? width;
  final double? height;
  final BoxDecoration? boxDecoration;
  final Color? backgroundColor;
  final String hint;
  final onTextChange;
  final errorText;
  final inputType;
  final textController;
  final bool isRequired;
  final String textInit;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: FONT_CONST.regular(
                    fontSize: 16, color: COLOR_CONST.mineShaft),
              ),
              if (isRequired == true)
                Text(
                  ' *',
                  style: FONT_CONST.regular(
                      fontSize: 16, color: COLOR_CONST.carnation),
                ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            decoration: boxDecoration ??
                const BoxDecoration(
                  gradient: appDefaultGradient,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
            child: Container(
                width: width ?? SizeConfig.screenWidth - 60,
                margin: const EdgeInsets.all(1),
                height: height ?? getProportionateScreenWidth(50),
                decoration: boxDecoration ??
                    BoxDecoration(
                      color: backgroundColor ?? COLOR_CONST.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                child: TextField(
                  controller: textController,
                  autofocus: false,
                  style: FONT_CONST.regular(),
                  keyboardType: inputType ?? TextInputType.text,
                  onChanged: onTextChange,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: FONT_CONST.light(color: COLOR_CONST.lynch),
                    counterText: '',
                    contentPadding: const EdgeInsets.fromLTRB(25, 0, 10, 0),
                    border: errorText != null
                        ? outlineInputBorderError
                        : outlineInputBorder,
                    enabledBorder: errorText != null
                        ? outlineInputBorderError
                        : outlineInputBorder,
                    focusedBorder: errorText != null
                        ? outlineInputBorderError
                        : outlineInputBorder,
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 12),
            child: Row(
              children: [
                if (errorText != null)
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 3),
                      child: Text(
                        errorText,
                        style: FONT_CONST.regular(
                            color: COLOR_CONST.carnation, fontSize: 12),
                        maxLines: 3,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.0),
    borderSide: const BorderSide(width: 0));

var outlineInputBorderError = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.0),
    borderSide: const BorderSide(color: COLOR_CONST.carnation));
