import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:gap/gap.dart';
import '../../data/model/recruitment_post_model.dart';
import '../../resources/barrel_const.dart';
import 'header_tab_bar.dart';
import 'item_card_swiper.dart';

class TabbarCardSwiperScreen extends StatelessWidget{
  const TabbarCardSwiperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return TabbarCardSwiperFormScreen(screenWidth: screenWidth,);
  }

}

class TabbarCardSwiperFormScreen extends StatefulWidget{
  const TabbarCardSwiperFormScreen({
    required this.screenWidth,
    super.key
  });

  final double screenWidth;

  @override
  State<TabbarCardSwiperFormScreen> createState() => _TabbarCardSwiperScreenState();
}

class _TabbarCardSwiperScreenState extends State<TabbarCardSwiperFormScreen> with SingleTickerProviderStateMixin{

  // ignore: prefer_typing_uninitialized_variables
  late final _controllerTabBarView;
  List<Tab> listTabBar = [];

  @override
  void initState() {
    super.initState();

    double screenWidth = widget.screenWidth -20;

    listTabBar = [
      Tab(
        child: SizedBox(
          width: screenWidth/2,
          child: const Text(
            'Lượt thích từ công ty',
            textAlign: TextAlign.center,
             style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      Tab(
        child: SizedBox(
          width: screenWidth/2,
          child:  const Text(
            'Tuyển dụng',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ];

    _controllerTabBarView = TabController(vsync: this, initialIndex: 1, length: listTabBar.length);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: COLOR_CONST.cornflowerBlue,
        title: const Text("Tabbar & Card Swiper"),
      ),
      extendBody: true,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HeaderTabBar(listTabBar: listTabBar, controllerTabBarView: _controllerTabBarView),

          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controllerTabBarView,
              children: [
                
                Container(color: Colors.white),

                CardSwiperWidget(),
              ]
            ),
          ),
        ],
      )
    ); 
  }
}

// ignore: must_be_immutable
class CardSwiperWidget extends StatefulWidget {
  CardSwiperWidget({
    super.key,
  });

  @override
  State<CardSwiperWidget> createState() => _CardSwiperWidgetState();
}

class _CardSwiperWidgetState extends State<CardSwiperWidget> with SingleTickerProviderStateMixin{

  final CardSwiperController controller = CardSwiperController();

  int currentIndexCheck = 0;

  final ValueNotifier<int> notifiChangeIndex = ValueNotifier<int>(0);
  final ValueNotifier<double> notifiChangeHeightItem = ValueNotifier<double>(minHeightItem);

  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    controller.events.listen((event) { 
      print("Minh Do ----- ${event}");
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    notifiChangeIndex.dispose();
    notifiChangeHeightItem.dispose();
  }

  Size getRedBoxSize(BuildContext context) {
    final box = context.findRenderObject() as RenderBox;
    return box.size;
  }

  EdgeInsets cardSwiperPadding = const EdgeInsets.only(
    left: 5,
    right: 5,
    top: 25,
    bottom: 20,
  );

  GlobalKey key = GlobalKey();

  bool isButton = false;




  @override
  Widget build(BuildContext context) {

    
    return SingleChildScrollView(
      child: Stack(
        children: [
          ValueListenableBuilder<int>(
            valueListenable: notifiChangeIndex,
            builder: (BuildContext context, int value, Widget? child) {
              key = GlobalKey();

              return Opacity(
                opacity: 0,
                child: Container(
                  padding: cardSwiperPadding,
                  margin: EdgeInsets.only(
                    bottom: cardSwiperPadding.top + cardSwiperPadding.bottom + 65
                  ),
                  child: LayoutBuilder(
                    builder: (context, data) {
                      return Container(
                        key: key,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 2
                          )
                        ),
                        child: ContentLayout(recruitmentPostModel: RecruitmentPostModel.getList()[value], isOpen: true)
                      );
                    }
                  ),
                ),
              );
            }
          ),

          Positioned.fill(
            child: CardSwiper(
              controller: controller,
              // duration: const Duration(milliseconds: 350),
              cardsCount: RecruitmentPostModel.getList().length,
              numberOfCardsDisplayed: 2,
              backCardOffset: const Offset(0, 0),
              scale: 1,
              threshold: 100,
              maxAngle: 40,
              padding: cardSwiperPadding,
              allowedSwipeDirection: const AllowedSwipeDirection.symmetric(
                horizontal: true
              ),
              cardBuilder: (context, index, horizontalThresholdPercentage, verticalThresholdPercentage) {
                
                return ItemCardSwiper(
                  index: index,
                  isButton: isButton,
                  currentIndexCheck: currentIndexCheck,
                  horizontalThresholdPercentage: horizontalThresholdPercentage,
                  isOpen: currentIndexCheck == index ? isOpen : false,
                  recruitmentPostModel: RecruitmentPostModel.getList()[index],
                  onChangeSizeItem:(value) {
                    isOpen = value;
                    
                    if(value){
                      final data = getRedBoxSize(key.currentContext ?? context);
                      notifiChangeHeightItem.value = data.height;
                    }else{
                      notifiChangeHeightItem.value = minHeightItem;
                    }

                  },
                );
            
                
              },
              onSwipe: (previousIndex, currentIndex, direction) {
                currentIndexCheck = currentIndex ?? 0;
                notifiChangeIndex.value = currentIndexCheck;
                isButton = false;
                isOpen = false;
                if(notifiChangeHeightItem.value != minHeightItem){
                  notifiChangeHeightItem.value = minHeightItem;
                }
                return true;
              },
              // isLoop: false,
            ),
          ),
        
          ValueListenableBuilder<double>(
            valueListenable: notifiChangeHeightItem,
            builder: (BuildContext context, double valueHeight, Widget? child) {
              return Positioned(
                right: 0,
                left: 0,
                top: valueHeight + cardSwiperPadding.bottom + cardSwiperPadding.top,
                height: 65,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      shape: const CircleBorder(),
                      onPressed: () {
                        isButton = true;
                        controller.swipe(CardSwiperDirection.left);
                      },
                      child: const Icon(Icons.close_rounded),
                    ),
                    const Gap(45),
                    FloatingActionButton(
                      shape: const CircleBorder(),
                      onPressed: () {
                        isButton = true;
                        controller.swipe(CardSwiperDirection.right);
                      },
                      child: const Icon(Icons.thumb_up_alt_rounded),
                    ),
                  ],
                ),
              );
            }
          ),     
        ],
      ),
    );
  }
}