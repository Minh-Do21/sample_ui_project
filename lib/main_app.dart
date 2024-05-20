import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_context/one_context.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sample_ui_project/screens/app_router.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key, required this.firstScreen}) : super(key: key);

  final Widget firstScreen;

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      headerBuilder: () => const ClassicHeader(
        refreshStyle: RefreshStyle.Follow,
        completeDuration: Duration(milliseconds: 200),
      ),
      footerBuilder: () => const ClassicFooter(
        loadStyle: LoadStyle.ShowWhenLoading,
        completeDuration: Duration(milliseconds: 200),
      ),
      headerTriggerDistance: 80,
      springDescription:
          // ignore: prefer_const_constructors
          SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
      maxOverScrollExtent: 100,
      maxUnderScrollExtent: 0,
      enableScrollWhenRefreshCompleted: true,
      enableLoadingWhenFailed: true,
      hideFooterWhenNotFull: false,
      enableBallisticLoad: true,
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.generateRoute,
        builder: (context, child) {
          child = BotToastInit()(context, child);
          child = OneContext().builder(context, child);
          return child;
        },
        navigatorObservers: [BotToastNavigatorObserver()],
        theme: ThemeData(
          brightness: Brightness.light,
          appBarTheme: AppBarTheme(
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: Colors.black),
          ),
        ),
        home: firstScreen,
      ),
    );
  }
}
