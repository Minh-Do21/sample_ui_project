import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SwiperCustom extends StatefulWidget{
  const SwiperCustom({super.key});

  @override
  State<SwiperCustom> createState() => _SwiperCustomState();
}

class _SwiperCustomState extends State<SwiperCustom> {

  Matrix4 transform = Matrix4.translationValues(0, 0, 0);
  double halfWidth = 0;

  @override
  Widget build(BuildContext context) {
    halfWidth = MediaQuery.of(context).size.width / 2;

    return Center(
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          

          if(details.localPosition.dx < halfWidth){
            
            final data = details.localPosition.dx - halfWidth;

            final goc = (halfWidth - details.localPosition.dx)/40;

            print("Minh Do ------- trái ${data}");

            setState(() {
              transform = Matrix4.translationValues(data, 0, 0)..rotateZ(goc/40);
            });
          }else if(details.localPosition.dx > halfWidth){
            // print("Minh Do ------- phải ${details.localPosition.dx - halfWidth}");

            final data = details.localPosition.dx - halfWidth;

            final goc = (halfWidth - details.localPosition.dx)/40;

            // print("Minh Do ------- phải ${data}");

            setState(() {
              transform = Matrix4.translationValues(data, 0, 0)..rotateZ(goc/40);
            });
            
          }else{
            // print("Minh Do ------- giữa");
          }




          
          // setState(() {
          //   // _count ++;
          //   transform = Matrix4.translationValues(details.globalPosition.dx, 0, 0);
           
          // });
        },
        onHorizontalDragEnd: (details) {
     
        double currentValue = 0.0; // Giá trị hiện tại, ban đầu là giá trị min


          final halfOfhalfWidth = halfWidth / 2;

          final dxEnd = transform.row0.a;
          
          //quẹt trái
          if(dxEnd < 0){
            //  print("Minh Do ------- $dxEnd // $halfOfhalfWidth");
            if(dxEnd < -halfOfhalfWidth){
              currentValue = dxEnd;
              Timer.periodic(Duration(milliseconds: 10), (timer) {
                if(currentValue <= -halfWidth*2){
                  timer.cancel();
                }
                currentValue -= 10;

                final goc = -currentValue/40;

                setState(() {
                  transform = Matrix4.translationValues(currentValue, 0, 0)..rotateZ(goc/40);
                });
                print("Minh Do ------- quẹt trái hết ${currentValue} // $halfWidth");
                
              });

            }else{
              print("Minh Do ------- đưa về gốc");
              setState(() {
                transform = Matrix4.translationValues(0, 0, 0)..rotateZ(0);
              });
            }
            
          }
          //quẹt phải
          else if(dxEnd > 0){
            // print("Minh Do ------- quẹt phải:  $dxEnd // $halfOfhalfWidth");
            if(dxEnd > halfOfhalfWidth){
              currentValue = dxEnd;
              Timer.periodic(Duration(milliseconds: 10), (timer) {
                if(currentValue >= halfWidth*2){
                  timer.cancel();
                }
                currentValue += 10;

                final goc = -currentValue/40;

                setState(() {
                  transform = Matrix4.translationValues(currentValue, 0, 0)..rotateZ(goc/40);
                });
                print("Minh Do ------- quẹt phải hết ${currentValue} // $halfWidth");
                
              });

            }else{
              print("Minh Do ------- đưa về gốc");
              setState(() {
                transform = Matrix4.translationValues(0, 0, 0)..rotateZ(0);
              });
            }
          }

        },
        child: 

        AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: Container(
              // width: 200,
              transform: transform,
              // height: 300,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Swiping Card',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
      ),
    );
  }
}