import 'package:flutter/material.dart';
import 'package:mor_flutter_project/resources/barrel_const.dart';
import 'package:mor_flutter_project/configs/size_config.dart';
import 'package:mor_flutter_project/utils/utils.dart';

class IntroductionContent extends StatelessWidget {
  const IntroductionContent({
    Key? key,
    this.title,
    this.message,
    this.image,
  }) : super(key: key);
  final String? title, message, image;

  @override
  Widget build(BuildContext context) {
    if (message == null || image == null) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 260,
              height: 260,
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                gradient: appDefaultGradient,
                borderRadius: BorderRadius.all(
                  Radius.circular(150),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(150),
                  ),
                  image: DecorationImage(
                    image: AssetImage(image!),
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          const VerticalSpacing(of: 20),
          Text(
            title!,
            textAlign: TextAlign.center,
            style: FONT_CONST.bold(fontSize: 22),
          ),
          const VerticalSpacing(of: 20),
          Text(
            message!,
            textAlign: TextAlign.center,
            style: FONT_CONST.regular(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
