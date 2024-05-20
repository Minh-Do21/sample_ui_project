import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VirtualKeyboardCustom extends StatelessWidget {
  VirtualKeyboardCustom({
    super.key,
    required this.onPressedKey,
  });

  final Function(String) onPressedKey;

  List<String> keyList = [
    "1", "2", "3", "4", "5", "6", "7", "8", "9", "", "0", "x", 
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      height: 365,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        primary: false,
        padding: EdgeInsets.zero,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        crossAxisCount: 3,
        children: List.generate(keyList.length, (index) {
          if(keyList[index].contains("x")){
            return TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade200),
                overlayColor: MaterialStateProperty.all<Color>(Colors.grey.shade400.withOpacity(0.6)),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                )
              ),
              onPressed: () {
                onPressedKey(keyList[index]);
              },
              child: const Icon(
                Icons.close_rounded,
                size: 22,
              ),
            );
          }
          else if(keyList[index].isNotEmpty){
            return TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade200),
                overlayColor: MaterialStateProperty.all<Color>(Colors.grey.shade400.withOpacity(0.6)),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                )
              ),
              onPressed: () {
                onPressedKey(keyList[index]);
              },
              child: Text(
                keyList[index],
                style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.w400),
              ),
            );
          }else{
            return  Container();
          }
        })
      ),
    );
  }
}