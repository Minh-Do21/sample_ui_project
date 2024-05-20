import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../data/model/recruitment_post_model.dart';

// ignore: must_be_immutable
class ItemCardSwiper extends StatefulWidget {

  ItemCardSwiper({
    super.key, 
    required this.currentIndexCheck,
    required this.index,
    required this.horizontalThresholdPercentage,
    required this.onChangeSizeItem,
    required this.isOpen,
    required this.recruitmentPostModel,
    required this.isButton,
  });

  final RecruitmentPostModel recruitmentPostModel;

  final int currentIndexCheck;
  final int index;
  final int horizontalThresholdPercentage;
  final Function(bool value) onChangeSizeItem;

  bool isOpen;

  final bool isButton;
  

  @override
  State<ItemCardSwiper> createState() => _ItemCardSwiperState();
}

class _ItemCardSwiperState extends State<ItemCardSwiper> {

  bool isPositiveNumbers(int number) {
    if (number > 0) {
      return true;
    } else {
      return false;
    }
  }

  Widget layout = Container();

  Widget _overlayCancel = Container();
  Widget _overlayLike = Container();

  int indexCheck = 0;

  @override
  void initState() {
    super.initState();
    buildUI();
  }

  buildUI(){
    indexCheck = widget.currentIndexCheck;

    layout = ContentLayout(recruitmentPostModel: widget.recruitmentPostModel, isOpen: widget.isOpen);

    if(widget.isOpen){
      _overlayCancel = overlayCancelFull;
      _overlayLike = overlayLikeFull;
    }else{
      _overlayCancel = overlayCancel;
      _overlayLike = overlayLike;
    }
  }


  @override
  Widget build(BuildContext context) {
   
    if(indexCheck != widget.currentIndexCheck){
      buildUI();
    }
  
    if(widget.index == widget.currentIndexCheck){

      double angle = 0;

      if(widget.isButton){
        angle = (widget.horizontalThresholdPercentage/1000.toDouble()).clamp(-0.3, 0.3);
      }
      
      return Column(
        children: [

          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: Transform.rotate(
            angle: - angle,
            child: Stack (
              children: [

                AnimatedSize(
                  curve: Curves.decelerate,
                  alignment: Alignment.topCenter,
                  duration: const Duration(milliseconds: 500),
                  child: LayoutBox( 
                    widget.isOpen 
                    ? layout 
                    : ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [layout],
                    ),
                    widget.isOpen,
                    (){
                      setState(() {
                        widget.isOpen = ! widget.isOpen;
                      });

                      buildUI();
                                
                      widget.onChangeSizeItem( widget.isOpen);
                    }
                  )
                ),
                      
                if((widget.horizontalThresholdPercentage != 0))...[
                  if(isPositiveNumbers(widget.horizontalThresholdPercentage))...[
                    Positioned.fill(
                      child: _overlayLike
                    ),
                  ]else...[
                    Positioned.fill(
                       child: _overlayCancel
                    ),
                  ]
                ],
              ],
            ),
          ),
          ),

          
        ],
      );
    }else{
      return Column(
        children: [
          LayoutBox(
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                layout,
              ],
            ),
            false,
            (){}
          )
        ],
      );
    }
  }

  // ignore: non_constant_identifier_names
  Widget LayoutBox(Widget layout, bool isOpen, Function() clickItem){
    return Container(
      height: isOpen ? null : minHeightItem,
      alignment: Alignment.center,
      decoration: isOpen ?
        BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.white,
            width: 2
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 12,
              offset: const Offset(0, 2), // Shadow position
            ),
          ],

        )
        : BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20),),
        border: Border.all(
          color: Colors.deepPurple.shade900,
          width: 2
        )
      ),
      child: Stack(
        children: [
          layout,
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20
              ),
              padding: const EdgeInsets.only(
                bottom: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5)
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isOpen ? Colors.white : Colors.deepPurple.shade900,
                ),
                onPressed: clickItem,
                child: Text(widget.isOpen ? 'Colse' : "Open", 
                style: TextStyle(color: 
                  isOpen ?Colors.deepPurple.shade900 : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

double minHeightItem = 450;

// ignore: non_constant_identifier_names
Widget ContentLayout({required RecruitmentPostModel recruitmentPostModel, required bool isOpen}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Gap(15),
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20
        ),
        child: Text(
          recruitmentPostModel.title,
          textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
        ),
      ),
      const Gap(10),
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20
        ),
        child: Text(
          recruitmentPostModel.nameCompany,
          textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
        ),
      ),
      const Gap(10),

      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20
        ),
        child: Wrap(
          spacing: 30,
          runSpacing: 8,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.all(Radius.circular(5))
              ),
              padding:const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 20,
                  ),
                  const Gap(5),
                  Text(
                    recruitmentPostModel.address,
                    style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            
            // const Gap(30),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.all(Radius.circular(5))
              ),
              padding:const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.attach_money_outlined,
                    size: 20,
                  ),
                  const Gap(5),
                  Text(
                    recruitmentPostModel.wage,
                    style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      const Gap(20),
      Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20
        ),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade300
            )
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(15),
            const Row(
              children: [
                Icon(
                  Icons.tag,
                  size: 20,
                ),
                Gap(5),
                Text(
                  "Đặc điểm công ty",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
                ),
              ],
            ),

            const Gap(10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(
                recruitmentPostModel.characteristicList.length,
                (index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: const BorderRadius.all(Radius.circular(50))
                    ),
                    padding:const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5
                    ),
                    child: Text(
                      recruitmentPostModel.characteristicList[index],
                      style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
                    ),
                  );
                }
              )
            ),
          ],
        ),
      ),


      const Gap(10),
      Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20
        ),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade300
            )
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(15),
            const Row(
              children: [
                Icon(
                  Icons.tag,
                  size: 20,
                ),
                Gap(5),
                Text(
                  "Kỹ năng yêu cầu",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
                ),
              ],
            ),

            const Gap(10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(
                recruitmentPostModel.requiredSkillsList.length,
                (index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: const BorderRadius.all(Radius.circular(50))
                    ),
                    padding:const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5
                    ),
                    child: Text(
                      recruitmentPostModel.requiredSkillsList[index],
                      style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
                    ),
                  );
                }
              )
            ),
          ],
        ),
      ),

      if(isOpen)...[
        const Gap(10),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20
          ),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey.shade300
              )
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(15),
              const Row(
                children: [
                  Icon(
                    Icons.tag,
                    size: 20,
                  ),
                  Gap(5),
                  Text(
                    "Yêu cầu tuyển dụng",
                    style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
                  ),
                ],
              ),

              const Gap(10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(
                  recruitmentPostModel.recruitmentList.length,
                  (index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: const BorderRadius.all(Radius.circular(50))
                      ),
                      padding:const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5
                      ),
                      child: Text(
                        recruitmentPostModel.recruitmentList[index],
                        style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
                      ),
                    );
                  }
                )
              ),
            ],
          ),
        ),

        Container(
          height: 75,
          margin: const EdgeInsets.only(
            top: 10,
            left: 20
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: recruitmentPostModel.imageList.length,
            itemBuilder: (context, index) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 5
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(
                      recruitmentPostModel.imageList[index],
                      width: 75,
                      height: 75,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ]else...[
        const Gap(200),
      ],
      const Gap(75),
    ],
  );
}


final Widget overlayCancel = Container(
  alignment: Alignment.center,
  decoration: BoxDecoration(
    color: Colors.black.withOpacity(0.4),
    borderRadius: const BorderRadius.all(Radius.circular(20),),
  ),
  child: const Icon(
    Icons.close_rounded,
    color: Colors.white,
    size: 100,
  ),
);

final Widget overlayCancelFull = Container(
  alignment: Alignment.center,
  decoration: BoxDecoration(
    color: Colors.black.withOpacity(0.4),
  ),
  child: const Icon(
    Icons.close_rounded,
    color: Colors.white,
    size: 100,
  ),
);

final Widget overlayLike = Container(
  alignment: Alignment.center,
  decoration: BoxDecoration(
    color: Colors.deepPurple.withOpacity(0.4),
    borderRadius: const BorderRadius.all(Radius.circular(20),),
  ),
  child: const Icon(
    Icons.thumb_up_alt_rounded,
    color: Colors.white,
    size: 100,
  ),
);

final Widget overlayLikeFull = Container(
  alignment: Alignment.center,
  decoration: BoxDecoration(
    color: Colors.deepPurple.withOpacity(0.4),
  ),
  child: const Icon(
    Icons.thumb_up_alt_rounded,
    color: Colors.white,
    size: 100,
  ),
);