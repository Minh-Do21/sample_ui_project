import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_ui_project/resources/barrel_const.dart';
import 'package:sample_ui_project/configs/size_config.dart';

// ignore: must_be_immutable
class EditTextCustom extends StatelessWidget {
  EditTextCustom({
    super.key, 
    required this.textController,
    required this.hint,
    required this.onTextChange,

    this.width,
    this.height,
    this.boxDecoration,
    this.backgroundColor,
    this.errorText,
    this.inputType,
    this.textInit = '',
    this.styleText,
    this.inputFormatters,
    this.showCursor = false,
    this.readOnly = false,

    this.errorBorderStyle,
    this.defaultBorderStyle,
  });
  final double? width;
  final double? height;
  final BoxDecoration? boxDecoration;
  final Color? backgroundColor;
  final String hint;
  final Function(String)onTextChange;
  final String? errorText;
  final TextInputType? inputType;
  final TextEditingController textController;
  final String textInit;
  final TextStyle? styleText;
  final List<TextInputFormatter>? inputFormatters;
  final bool showCursor;
  final bool readOnly;
  
  InputBorder? errorBorderStyle;
  InputBorder? defaultBorderStyle;

  @override
  Widget build(BuildContext context) {
    errorBorderStyle ??= outlineInputBorderError;
    defaultBorderStyle ??= outlineInputBorder;
    

    return Column(
      children: [
        SizedBox(
          width: width ?? SizeConfig.screenWidth - 60,
          height: height ?? 50,
          child: TextField(
            controller: textController,
            autofocus: false,
            showCursor: showCursor,
            readOnly: readOnly,
            style: styleText ?? FONT_CONST.regular(color: COLOR_CONST.black),
            keyboardType: inputType ?? TextInputType.text,
            onChanged: onTextChange,
            inputFormatters: null,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: FONT_CONST.light(color: COLOR_CONST.lynch),
              counterText: '',
              contentPadding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              border: errorText != null
                  ? errorBorderStyle
                  : defaultBorderStyle,
              enabledBorder: errorText != null
                  ? errorBorderStyle
                  : defaultBorderStyle,
              focusedBorder: errorText != null
                  ? errorBorderStyle
                  : focusedBorder,
            ),
          )
        ),
        if (errorText != null)
        Container(
          width: width ?? SizeConfig.screenWidth - 60,
          padding: const EdgeInsets.only(top: 5, left: 10),
          child: Row(
            children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 3),
                    child: Text(
                      errorText ?? "",
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
    );
  }
}

var outlineInputBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: Colors.grey, width: 2.0),
  borderRadius: BorderRadius.circular(12.0),
);

var focusedBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
  borderRadius: BorderRadius.circular(12.0),
);

var outlineInputBorderError = OutlineInputBorder(
  borderSide: const BorderSide(color: Colors.red, width: 2.0),
  borderRadius: BorderRadius.circular(12.0)
);
