import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sample_ui_project/resources/barrel_const.dart';
import 'package:sample_ui_project/configs/size_config.dart';
import 'package:sample_ui_project/utils/utils.dart';

class CustomSelectInput extends StatelessWidget {
  const CustomSelectInput(
      {required this.title,
      this.titleSize,
      required this.hint,
      required this.onTextChange,
      this.errorText,
      this.inputType,
      this.textController,
      this.textInit = '',
      this.focusNode,
      this.filled = false,
      required this.press});

  final String title;
  final double? titleSize;
  final String hint;
  final onTextChange;
  final errorText;
  final inputType;
  final textController;
  final String textInit;
  final FocusNode? focusNode;
  final bool? filled;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: FONT_CONST.regular(fontSize: titleSize ?? 18),
            ),
            const VerticalSpacing(of: 7),
            Container(
              decoration: const BoxDecoration(
                gradient: appDefaultGradient,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.all(1),
                height: getProportionateScreenWidth(50),
                decoration: const BoxDecoration(
                  color: COLOR_CONST.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: GestureDetector(
                  onTap: press,
                  child: TextField(
                    enableInteractiveSelection: false,
                    enabled: false,
                    controller: textController,
                    focusNode: focusNode,
                    autofocus: false,
                    style: FONT_CONST.regular(),
                    keyboardType: inputType ?? TextInputType.text,
                    onChanged: onTextChange,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 17),
                        child: Container(
                          alignment: Alignment.centerRight,
                          width: 0,
                          child: SvgPicture.asset(
                            ICON_CONST.icOpenBold.path,
                            width: 18,
                          ),
                        ),
                      ),
                      hintText: hint,
                      hintStyle: FONT_CONST.regular(color: COLOR_CONST.lynch),
                      counterText: '',
                      contentPadding: const EdgeInsets.fromLTRB(14, 17, 14, 17),
                      border: errorText != null
                          ? outlineInputBorderError
                          : outlineInputBorder,
                      enabledBorder: errorText != null
                          ? outlineInputBorderError
                          : outlineInputBorder,
                      focusedBorder: errorText != null
                          ? outlineInputBorderError
                          : outlineInputBorder,
                      disabledBorder: errorText != null
                          ? outlineInputBorderError
                          : outlineInputBorder,
                      fillColor: COLOR_CONST.purpleHeart,
                      filled: filled,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 12),
              child: Row(
                children: [
                  if (errorText != null)
                    Text(
                      errorText,
                      style: FONT_CONST.regular(
                          color: COLOR_CONST.carnation, fontSize: 12),
                    ),
                  Container(
                    width: 0,
                    height: 14,
                    color: COLOR_CONST.backgroundColor,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.0),
    borderSide: const BorderSide(width: 0));

var outlineInputBorderError = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.0),
    borderSide: const BorderSide(color: COLOR_CONST.carnation));
