import 'package:flutter/material.dart';

class HeaderTabBar extends StatelessWidget {
  const HeaderTabBar({super.key, 
    required this.listTabBar,
    required controllerTabBarView,
  }) : _controllerTabBarView = controllerTabBarView;

  final List<Tab> listTabBar;
  // ignore: prefer_typing_uninitialized_variables
  final _controllerTabBarView;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 25,
      ),
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(100),
        ),
        // padding: const EdgeInsets.all(3),   
        child: DefaultTabController(
          length: listTabBar.length,
          child: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: TabBar(
              controller: _controllerTabBarView,
              // isScrollable: true,
              labelPadding: const EdgeInsets.all(0),
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.deepPurple.shade900,
              ),
              dividerColor: Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey.shade700,
              tabs: listTabBar,
            )
          ),
        ),
      ),
    );
  }
}