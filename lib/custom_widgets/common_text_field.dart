import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mor_flutter_project/configs/size_config.dart';

import '../resources/barrel_const.dart';

// ignore: must_be_immutable
class CommonTextField extends StatelessWidget {
  CommonTextField({
    super.key,
    this.suffixIcon,
    this.controller,
    this.inputFormatters,
    this.focusNode,
    this.keyboardType,
    this.minLines,
    this.validator,
    this.hintText,
    this.enabled = true,
    this.onEditingComplete,
    this.onChanged,
    this.onTap,
    this.onFieldSubmitted,
    this.maxLines,
    this.borderContainer,
    this.maxLength,
    this.initialValue,
    this.height,
    this.contentPadding,
    this.maxWidth,
    this.textAlign,
    this.textStyle,
  });
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final String? Function(String?)? validator;
  final String? hintText;
  final double? height;

  final bool enabled;
  final String? initialValue;

  final Function? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final Function()? onTap;
  final BoxDecoration? borderContainer;
  final EdgeInsetsGeometry? contentPadding;
  final double? maxWidth;
  final TextAlign? textAlign;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      constraints:
          BoxConstraints(maxWidth: maxWidth ?? SizeConfig.screenWidthMax),
      decoration: borderContainer,
      child: TextFormField(
        style: textStyle ??
            FONT_CONST.medium(
              fontSize: 16,
              color: COLOR_CONST.lineGrey,
            ),
        textAlign: textAlign ?? TextAlign.start,
        enabled: enabled,
        controller: controller,
        focusNode: focusNode,
        autofocus: false,
        initialValue: initialValue,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        minLines: minLines ?? 1,
        keyboardType: keyboardType ?? TextInputType.text,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        maxLength: maxLength,
        onTap: onTap,
        maxLines: maxLines,
        onFieldSubmitted: onFieldSubmitted,
        onEditingComplete: () {
          FocusScope.of(context).unfocus();
          if (onEditingComplete != null) {
            onEditingComplete!();
          }
        },
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          hintStyle: FONT_CONST.regular(
            fontSize: 11,
            color: COLOR_CONST.lineGrey,
          ),
          errorStyle: FONT_CONST.regular(
            fontSize: 11,
            color: COLOR_CONST.jasper,
          ),
          counterText: '',
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(horizontal: 11, vertical: 10),
          border:
              borderContainer != null ? InputBorder.none : outlineInputBorder,
          enabledBorder:
              borderContainer != null ? InputBorder.none : outlineInputBorder,
          focusedBorder:
              borderContainer != null ? InputBorder.none : outlineInputBorder,
          errorBorder: borderContainer != null
              ? InputBorder.none
              : outlineInputBorderError,
          disabledBorder:
              borderContainer != null ? InputBorder.none : outlineInputBorder,
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: suffixIcon,
                )
              : null,
          suffixIconConstraints: const BoxConstraints(
            minWidth: 15,
            minHeight: 13,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: COLOR_CONST.gray1));

  OutlineInputBorder outlineInputBorderError = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: COLOR_CONST.carnation));
}
