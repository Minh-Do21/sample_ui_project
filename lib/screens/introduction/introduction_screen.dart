import 'package:flutter/material.dart';
import 'package:sample_ui_project/resources/barrel_const.dart';
import 'package:sample_ui_project/custom_widgets/primary_button.dart';
import 'package:sample_ui_project/screens/app_router.dart';
import 'package:sample_ui_project/configs/size_config.dart';
import 'components/introduction_content.dart';
import 'package:easy_localization/easy_localization.dart';

class IntroductionScreen extends StatefulWidget {
  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<IntroductionScreen> {
  int currentPage = 0;
  String titleButton = "TIẾP TỤC";
  List<Map<String, String?>> itroductionData = [
    {
      'title': 'Introduction 1',
      'message': 'msg_introduction_1'.tr(),
      'image': 'assets/images/intro1.jpg'
    },
    {
      'title': 'Introduction 2',
      'message': 'msg_introduction_2'.tr(),
      'image': 'assets/images/intro2.jpg'
    },
    {
      'title': 'Introduction 3',
      'message': 'msg_introduction_3'.tr(),
      'image': 'assets/images/intro3.jpg',
    }
  ];

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    bool isLastPage = currentPage + 1 == itroductionData.length;
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: COLOR_CONST.backgroundColor,
      body: SafeArea(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Text(
                      "${currentPage + 1}/${itroductionData.length}",
                      style: FONT_CONST.bold(fontSize: 16),
                    ),
                    const Spacer(flex: 1),
                    InkWell(
                      onTap: () => {startDasboardScreen()},
                      child: Text(
                        "title_skip".tr(),
                        style: FONT_CONST.bold(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  controller: _controller,
                  itemCount: itroductionData.length,
                  itemBuilder: (context, index) => IntroductionContent(
                    title: itroductionData[index]['title'],
                    image: itroductionData[index]['image'],
                    message: itroductionData[index]['message'],
                  ),
                ),
              ),
              PrimaryButton(
                title: isLastPage ? 'title_begin'.tr() : 'title_next'.tr(),
                onPressed: () {
                  startDasboardScreen();
                },
                width: 250,
              ),
              const VerticalSpacing(of: 20),
              VerticalSpacing(of: SizeConfig.paddingBottom + 20),
            ],
          ),
        ),
      ),
    );
  }

  void startDasboardScreen() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRouter.LOGIN_SCREEN, (route) => false);
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(right: 5),
        height: 8,
        width: currentPage == index ? 8 : 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentPage == index
              ? COLOR_CONST.white
              : COLOR_CONST.silverChalice,
        ));
  }
}
