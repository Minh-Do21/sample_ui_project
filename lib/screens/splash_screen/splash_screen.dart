import 'package:flutter/material.dart';
import 'package:sample_ui_project/resources/barrel_const.dart';
import 'package:sample_ui_project/configs/size_config.dart';

import '../app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  Future<void> checkLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushNamedAndRemoveUntil(
        AppRouter.MENU_SCREEN, (route) => false);
    
    // Navigator.of(context).pushNamedAndRemoveUntil(
    //     AppRouter.INTRODUCTION_SCREEN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: COLOR_CONST.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Text(
              "Sample UI",
              style: FONT_CONST.semoBold(
                        color: COLOR_CONST.white, fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }
}
