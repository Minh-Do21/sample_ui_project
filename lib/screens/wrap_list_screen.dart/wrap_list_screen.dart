import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../resources/barrel_const.dart';

class WrapListScreen extends StatefulWidget{
  const WrapListScreen({super.key});

  @override
  State<WrapListScreen> createState() => _WrapListScreenState();
}

class _WrapListScreenState extends State<WrapListScreen> {

  bool isViewAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_CONST.white,
      appBar: AppBar(
        backgroundColor: COLOR_CONST.cornflowerBlue,
        title: const Text("Wrap List"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Danh sách hastag",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 20
                  ),
                  child: CupertinoButton(
                    minSize: 0,
                    padding: EdgeInsets.zero,
                    onPressed: (){
                      setState(() {
                        isViewAll = !isViewAll;
                      });
                    },
                    child: Text(
                      isViewAll ? "Thu gọn" : "Xem tất cả",
                      style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
      
            const Gap(10),
        
            if(isViewAll)...[
              WrapComponent(),
            ]else...[
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: 1000,
                  child: WrapComponent(),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget WrapComponent() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(
        50,
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
              'Hastag $index',
              style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
            ),
          );
        }
      )
    );
  }
}