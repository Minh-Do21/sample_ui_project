import 'package:mor_flutter_project/custom_widgets/common_text_field.dart';
import 'package:mor_flutter_project/custom_widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:mor_flutter_project/resources/barrel_const.dart';
import 'package:mor_flutter_project/screens/app_router.dart';
import 'package:mor_flutter_project/configs/size_config.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: COLOR_CONST.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Center(
          child: Container(
            padding: EdgeInsets.only(
                top: SizeConfig.paddingTop, bottom: SizeConfig.paddingBottom),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    IMAGE_CONST.logoApp.path,
                    fit: BoxFit.contain,
                    width: getProportionateScreenWidth(165),
                    height: getProportionateScreenHeight(85),
                  ),
                  const VerticalSpacing(of: 35),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: FONT_CONST.bold(
                            color: COLOR_CONST.white, fontSize: 13),
                      ),
                      const SizedBox(height: 5),
                      CommonTextField(
                        hintText: 'Username',
                        maxLength: 255,
                      ),
                    ],
                  ),
                  const VerticalSpacing(of: 9),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: FONT_CONST.bold(
                            color: COLOR_CONST.white, fontSize: 13),
                      ),
                      const SizedBox(height: 5),
                      CommonTextField(
                        hintText: 'Password',
                        maxLength: 255,
                      ),
                    ],
                  ),
                  const VerticalSpacing(of: 70),
                  PrimaryButton(
                    title: 'Login',
                    textStyle: FONT_CONST.bold(
                        color: COLOR_CONST.spanishBlue, fontSize: 13),
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRouter.DASHBOARD_SCREEN, (route) => false);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
