import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:mor_flutter_project/resources/barrel_const.dart';
import 'package:mor_flutter_project/configs/size_config.dart';
import 'package:mor_flutter_project/utils/utils.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.title,
    this.width,
    this.height,
    this.onPressed,
    this.borderRadius,
    this.fontSize,
    this.backgroundColor,
    this.boxDecoration,
    this.textStyle,
  }) : super(key: key);

  final String? title;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final Color? backgroundColor;
  final BoxDecoration? boxDecoration;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? SizeConfig.screenWidth,
      height: height ?? SizeConfig.buttonHeightDefault,
      constraints: BoxConstraints(maxWidth: SizeConfig.screenWidthMax),
      decoration: boxDecoration ??
          BoxDecoration(
            color: backgroundColor ?? COLOR_CONST.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
      child: MaterialButton(
        onPressed: onPressed,
        elevation: 0,
        padding: EdgeInsets.zero,
        highlightColor: Colors.transparent,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? appDefaultRadius,
        ),
        child: Text(title ?? '',
            style: textStyle ??
                FONT_CONST.semoBold(
                  color: COLOR_CONST.backgroundColor,
                  fontSize: fontSize ?? 16,
                ),
            textAlign: TextAlign.center),
      ),
    );
  }
}

class PrimaryBorderButton extends StatelessWidget {
  const PrimaryBorderButton({
    Key? key,
    required this.title,
    this.width,
    this.height,
    this.onPressed,
    this.borderRadius,
    this.colorRadius,
    this.fontSize,
    this.backgroundColor,
    this.boxDecoration,
    this.textStyle,
    this.colorsGradientText,
  }) : super(key: key);

  final String? title;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? colorRadius;
  final BoxDecoration? boxDecoration;
  final TextStyle? textStyle;
  final List<Color>? colorsGradientText;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: MaterialButton(
            onPressed: onPressed,
            elevation: 0,
            padding: EdgeInsets.zero,
            highlightColor: Colors.transparent,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius:
                  borderRadius ?? const BorderRadius.all(Radius.circular(20)),
            ),
            child: GradientText(
              title ?? '',
              style: textStyle ??
                  FONT_CONST.semoBold(
                    color: COLOR_CONST.purpleHeart,
                    fontSize: fontSize ?? 18,
                  ),
              colors: colorsGradientText ??
                  [
                    COLOR_CONST.purpleHeart,
                    COLOR_CONST.jaffa,
                  ],
            )),
      ),
    );
  }
}
