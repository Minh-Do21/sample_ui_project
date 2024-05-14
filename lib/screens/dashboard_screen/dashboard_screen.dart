import 'package:mor_flutter_project/screens/dashboard_screen/bloc/dashboard_bloc.dart';
import 'package:mor_flutter_project/screens/dashboard_screen/bottom_bar_item_type.dart';
import 'package:flutter/material.dart';
import 'package:mor_flutter_project/resources/barrel_const.dart';
import 'package:mor_flutter_project/configs/size_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (SizeConfig.appBarSize == null) {
      SizeConfig().init(context);
    }

    return RepositoryProvider(
      create: (context) => null,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DashboardBloc(),
          ),
        ],
        child: const DashboardBody(),
      ),
    );
  }
}

class DashboardBody extends StatefulWidget {
  const DashboardBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardBodyState createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
  int _currentIndex = 0;

  final List<Widget> _pageList =
      BottomBarItemType.values.map((e) => e.widget).toList();

  @override
  void initState() {
    super.initState();
  }

  void _indexChange(int toIndex) {
    setState(() {
      _currentIndex = toIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: _pageList,
      ),
      bottomNavigationBar: _bottomNav(),
    );
  }

  Container _bottomNav() {
    return Container(
      height: 56 + SizeConfig.paddingBottom,
      padding: EdgeInsets.only(bottom: SizeConfig.paddingBottom),
      decoration: const BoxDecoration(
        color: COLOR_CONST.backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            BottomBarItemType.values.length,
            (index) => _bottomNavibarItem(
                currentIndex: index,
                icon: BottomBarItemType.values[index].icon,
                text: BottomBarItemType.values[index].text,
                onTap: () {
                  _indexChange(index);
                })),
      ),
    );
  }

  Widget _bottomNavibarItem({
    required IconData icon,
    required VoidCallback onTap,
    required String text,
    required int currentIndex,
  }) {
    bool isSlected = currentIndex == _currentIndex;
    return Expanded(
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: isSlected ? Colors.red : Colors.white,
                ),
                const VerticalSpacing(of: 3),
                Text(
                  text,
                  style: FONT_CONST.semoBold(
                    fontSize: 10,
                    color: isSlected ? Colors.red : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
