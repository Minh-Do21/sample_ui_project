import 'package:flutter/material.dart';
import 'package:sample_ui_project/resources/barrel_const.dart';
import 'package:sample_ui_project/configs/size_config.dart';

class CustomRadio<T> extends StatelessWidget {
  const CustomRadio({
    required this.value,
    required this.groupValue,
    required this.title,
    required this.onChanged,
  });

  final T value;
  final T groupValue;
  final Widget title;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return value != ''
        ? GestureDetector(
            onTap: () {
              onChanged(value);
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: appDefaultPadding / 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(2),
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1.0,
                        color: COLOR_CONST.mineShaft,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: value == groupValue
                            ? COLOR_CONST.purpleHeart
                            : Colors.transparent,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      child: title,
                    ),
                  )
                ],
              ),
            ),
          )
        : Container();
  }
}
