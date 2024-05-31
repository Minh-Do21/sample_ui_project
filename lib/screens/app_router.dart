// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sample_ui_project/screens/barrel_screens.dart';

class AppRouter {
  static const String INTRODUCTION_SCREEN = 'instroduction_screen';
  static const String DASHBOARD_SCREEN = 'dashboard_screen';
  static const String LOGIN_SCREEN = 'login_screen';
  static const String HOME_SCREEN = 'home_screen';

  static const String MENU_SCREEN = 'menu_screen';
  static const String EXPANSION_PANEL_SCREEN = 'expansion_panel_screen';
  static const String TABBAR_CARD_SWIPER_SCREEN = 'tabbar_card_swiper_screen';
  static const String VIRTUAL_KEYBOARD_SCREEN = 'virtual_keyboard_screen';
  static const String WRAP_LIST_SCREEN = 'wrap_list_screen';
  static const String DROP_BOX_SCREEN = 'drop_box_screen';
  static const String INTRO_POPUP_SCREEN = 'intro_popup_screen';
  static const String CHAT_SCREEN = 'chat_screen';
  static const String BROWSER_SCREEN = 'browser_screen';
  static const String PREVIEW_IMAGE = 'preview_image';

  // Generate Router
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case INTRODUCTION_SCREEN:
        return MaterialPageRoute(builder: (_) => IntroductionScreen());
      case DASHBOARD_SCREEN:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => DashboardScreen(),
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case LOGIN_SCREEN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case HOME_SCREEN:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case MENU_SCREEN:
        return MaterialPageRoute(builder: (_) => const MenuScreen());
      case EXPANSION_PANEL_SCREEN:
        return MaterialPageRoute(builder: (_) => const ExpansionPanelScreen());
      case TABBAR_CARD_SWIPER_SCREEN:
        return MaterialPageRoute(builder: (_) => const TabbarCardSwiperScreen());
      case VIRTUAL_KEYBOARD_SCREEN:
        return MaterialPageRoute(builder: (_) => const VirtualKeyboardScreen());
      case WRAP_LIST_SCREEN:
        return MaterialPageRoute(builder: (_) => const WrapListScreen());
      case DROP_BOX_SCREEN:
        return MaterialPageRoute(builder: (_) => const DropBoxScreen());
      case INTRO_POPUP_SCREEN:
        return MaterialPageRoute(builder: (_) => const IntroPopupScreen());
      case CHAT_SCREEN:
        return MaterialPageRoute(builder: (_) => ChatScreen());
      case BROWSER_SCREEN:
        return MaterialPageRoute(
            builder: (_) =>
                BrowserScreen(args: settings.arguments as BrowserArgument));
       case PREVIEW_IMAGE:
        return MaterialPageRoute(
            builder: (_) =>
                PreviewImage(messageModel: settings.arguments as MessageModel,));

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
