import 'package:sample_ui_project/screens/home_screen/home_screen.dart';

import 'package:flutter/material.dart';

enum BottomBarItemType {
  tab1,
  tab2,
  tab3,
  tab4,
}

extension BottomBarItemTypeX on BottomBarItemType {
  // ignore: missing_return
  IconData get icon {
    switch (this) {
      case BottomBarItemType.tab1:
        return Icons.home;
      case BottomBarItemType.tab2:
        return Icons.save;
      case BottomBarItemType.tab3:
        return Icons.notifications;
      case BottomBarItemType.tab4:
        return Icons.settings;
    }
  }

  String get text {
    switch (this) {
      case BottomBarItemType.tab1:
        return "Home";
      case BottomBarItemType.tab2:
        return "Save";
      case BottomBarItemType.tab3:
        return "Notification";
      case BottomBarItemType.tab4:
        return "Account";
    }
  }

  Widget get widget {
    switch (this) {
      case BottomBarItemType.tab1:
        return const HomeScreen();
      case BottomBarItemType.tab2:
        return const HomeScreen();
      case BottomBarItemType.tab3:
        return const HomeScreen();
      case BottomBarItemType.tab4:
        return const HomeScreen();
    }
  }
}
