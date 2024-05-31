import 'package:flutter/material.dart';
import '../../data/model/item_menu.dart';
import '../../resources/color_const.dart';
import '../app_router.dart';

class MenuScreen extends StatefulWidget{
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  List<ItemMenu> listMenu = [];

  @override
  void initState() {
    super.initState();

    listMenu = [
      ItemMenu(
        title: "Expansion Panel",
        routeSettings: AppRouter.EXPANSION_PANEL_SCREEN
      ),
      ItemMenu(
        title: "Tabbar & Card Swiper",
        routeSettings: AppRouter.TABBAR_CARD_SWIPER_SCREEN
      ),
      ItemMenu(
        title: "Virtual Keyboard",
        routeSettings: AppRouter.VIRTUAL_KEYBOARD_SCREEN
      ),
      ItemMenu(
        title: "Wrap List",
        routeSettings: AppRouter.WRAP_LIST_SCREEN
      ),
      ItemMenu(
        title: "Drop Box",
        routeSettings: AppRouter.DROP_BOX_SCREEN
      ),
      ItemMenu(
        title: "Intro Popup",
        routeSettings: AppRouter.INTRO_POPUP_SCREEN
      ),
      ItemMenu(
        title: "Chat",
        routeSettings: AppRouter.CHAT_SCREEN
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_CONST.white,
      appBar: AppBar(
        backgroundColor: COLOR_CONST.cornflowerBlue,
        title: const Text("Sample UI Menu"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: listMenu.length,
          padding: const EdgeInsets.symmetric(
            horizontal: 20
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(listMenu[index].routeSettings);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                color: COLOR_CONST.border,
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                child: Text(
                  '${index+1}. ${listMenu[index].title}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}