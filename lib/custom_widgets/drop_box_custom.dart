
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../resources/barrel_const.dart';


// ignore: must_be_immutable
class DropBoxCustom extends StatefulWidget {
  DropBoxCustom({
    super.key, 
    required this.label, 
    required this.dataList, 
    required this.dataInit, 
    required this.dataSelected,

    this.lableStyle,
    this.width,
    this.height,
    this.backgroundColor,
    this.paddingItem,
    this.borderRadius,
    this.iconWidget,
    this.isRequieLabel = false,
    this.hintText,
  });

  final String label;
  final List<ItemDataDropdown> dataList;
  ItemDataDropdown? dataInit;
  final Function(ItemDataDropdown?) dataSelected;
  final TextStyle? lableStyle;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? paddingItem;
  final BorderRadiusGeometry? borderRadius;
  final Widget? iconWidget;
  final bool isRequieLabel;
  final String? hintText;

  @override
  State<DropBoxCustom> createState() => _DropBoxCustomState();
}

class _DropBoxCustomState extends State<DropBoxCustom> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Tooltip(
                message: widget.label,
                child: Text(
                  widget.label,
                  style: widget.lableStyle ?? FONT_CONST.regular(
                    color: COLOR_CONST.black, fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            if(widget.isRequieLabel)...[
               Text(
                "*",
                style:FONT_CONST.regular(
                  color: COLOR_CONST.red, fontSize: 14),
              ),
            ]
          ],
        ),
        const Gap(10),
        SizedBox(
          width: widget.width,
          height: widget.height ?? 45,
          child: DropdownButtonHideUnderline(
            child:  DropdownButton2<ItemDataDropdown>(
              value: widget.dataInit,
              isExpanded: true,
              hint: widget.hintText != null 
                ? Text(
                  widget.hintText ?? "",
                  style:FONT_CONST.regular(
                    color: COLOR_CONST.black,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ) : null,
              iconStyleData: IconStyleData(
                icon: widget.iconWidget ?? const Icon(Icons.keyboard_arrow_down_outlined, color: COLOR_CONST.black,)
              ),
              menuItemStyleData: MenuItemStyleData(
                height: 40,
                padding: widget.paddingItem ?? const EdgeInsets.all(12)
              ),
              buttonStyleData: ButtonStyleData(
                height: 45,
                padding: const EdgeInsets.only(right: 18, left: 7),
                decoration: BoxDecoration(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(4),
                  border: Border.all(
                    color: COLOR_CONST.gainsboro,
                  ),
                  color: widget.backgroundColor ?? COLOR_CONST.black,
                ),
      
              ),
              onChanged: (value) {
                setState(() {
                  widget.dataInit = value;
                });
                widget.dataSelected(value);
              },
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                // width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.white,
                ),
                offset: const Offset(0, -5),
                elevation: 1,
                
                // scrollbarTheme: ScrollbarThemeData(
                //   radius: const Radius.circular(0),
                //   thickness: MaterialStateProperty.all(6),
                //   thumbVisibility: MaterialStateProperty.all(true),
                // ),
              ),
              items: widget.dataList.map((ItemDataDropdown item) => DropdownMenuItem<ItemDataDropdown>(
                value: item,
                child: Text(
                  item.title,
                  style:FONT_CONST.regular(
                    color: COLOR_CONST.black,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ))
              .toList(),
            )
          ),
        ),
      ],
    );
  }
}

class ItemDataDropdown {
  final String index;
  final String title;
  final String? imgPath;
  final dynamic object;
  ItemDataDropdown({
    required this.index,
    required this.title,
    this.imgPath,
    required this.object,
  });
}

