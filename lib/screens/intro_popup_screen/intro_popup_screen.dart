import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sample_ui_project/configs/size_config.dart';

import '../../custom_widgets/primary_button.dart';
import '../../resources/barrel_const.dart';

class IntroPopupScreen extends StatefulWidget {
  const IntroPopupScreen({super.key});

  @override
  State<IntroPopupScreen> createState() => _IntroPopupScreenState();
}

class _IntroPopupScreenState extends State<IntroPopupScreen> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  Future<void> showPopUp() async{

    //190 là kích thước của item
    final startPostion = SizeConfig.screenWidth/2 - 190/2;

    _animation = Tween<double>(begin: startPostion, end: startPostion + 50).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));

    _controller.repeat(reverse: true);

    int pageIndex = 1;
    double angle = -0.12;

    final ValueNotifier<int> isInputbarcode = ValueNotifier<int>(pageIndex);

    // ignore: use_build_context_synchronously
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (mContext) => Center(
        child: ValueListenableBuilder<int>(
            valueListenable: isInputbarcode,
            builder: (BuildContext context, int pageIndex, Widget? child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: SizeConfig.screenWidth,
                      height: 230,
                      // color: COLOR_CONST.red,
                    ),

                    Center(
                      child: Container(
                        width: 190,
                        height: 230,
                        decoration: const BoxDecoration(
                          color: COLOR_CONST.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                      ),
                    ),
    
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Positioned(
                          left: _animation.value,
                          child: Transform.rotate(
                            angle: angle,
                            child: Container(
                              width: 190,
                              height: 230,
                              decoration: BoxDecoration(
                                color: pageIndex == 1 ? COLOR_CONST.blueYonder.withOpacity(0.8) : COLOR_CONST.philippineGray.withOpacity(0.8),
                                borderRadius: const BorderRadius.all(Radius.circular(20))
                              ),
                              child: Icon(
                                pageIndex == 1 ? Icons.thumb_up_alt_rounded : Icons.close_rounded,
                                  color: Colors.white,
                                  size: 50,
                              ),
                            ),
                          ),
                        );
                      }
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 30
                  ),
                  child: Text(
                    pageIndex == 1 ? 'Vuốt sang phải để Like -- $pageIndex' : 'Vuốt sang trái để Skip -- $pageIndex',
                    style: FONT_CONST.regular(fontSize: 16, color: COLOR_CONST.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                PrimaryButton(
                  title: "Tiếp theo",
                  onPressed: () {
                    if(pageIndex == 1){
                      _controller.stop();

                      _animation = Tween<double>(begin: startPostion, end: startPostion-50).animate(CurvedAnimation(
                        parent: _controller,
                        curve: Curves.linear,
                      ));

                      _controller.repeat(reverse: true);
                      
                      isInputbarcode.value = 2;
                      angle = 0.12;
                    }else{
                      Navigator.pop(mContext);
                    }
                  },
                  width: 250,
                ),

                const Gap(60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: pageIndex == 1 ? COLOR_CONST.white : COLOR_CONST.philippineGray.withOpacity(0.8),
                        borderRadius: const BorderRadius.all(Radius.circular(20))
                      ),
                    ),
                    const Gap(10),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: pageIndex == 2 ? COLOR_CONST.white : COLOR_CONST.philippineGray.withOpacity(0.8),
                        borderRadius: const BorderRadius.all(Radius.circular(20))
                      ),
                    ),
                  ],
                )
              ],
            );
          }
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

     WidgetsBinding.instance.addPostFrameCallback((_) {
      showPopUp();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_CONST.white,
      appBar: AppBar(
        backgroundColor: COLOR_CONST.cornflowerBlue,
        title: const Text("Intro Popup"),
      ),
      body: Center(
        child: TextButton(
          onPressed: (){
            showPopUp();
          }, 
          child: const Text("Show Popup")
        )
      ),
    );
  }
}