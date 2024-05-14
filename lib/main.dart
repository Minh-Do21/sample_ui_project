import 'package:easy_localization/easy_localization.dart';
import 'package:mor_flutter_project/main_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mor_flutter_project/screens/barrel_screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  await EasyLocalization.ensureInitialized();

  const locate = Locale('vi');

  runApp(EasyLocalization(
    path: 'assets/translations',
    supportedLocales: const [Locale('vi')],
    startLocale: locate,
    fallbackLocale: const Locale('vi'),
    child: const MainApp(
      firstScreen: SplashScreen(),
    ),
  ));
}
