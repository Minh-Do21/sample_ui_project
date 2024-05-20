import 'package:flutter/material.dart';

class ItemFilterChip extends StatefulWidget {
   const ItemFilterChip({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onSelected,
  });

  final String title;
  final bool isSelected;
  final Function(bool) onSelected;

  @override
  State<ItemFilterChip> createState() => _ItemFilterChipState();
}

class _ItemFilterChipState extends State<ItemFilterChip> {

  final ValueNotifier<bool> isChangeValue = ValueNotifier<bool>(false);
  
  @override
  void initState() {
    super.initState();
    isChangeValue.value = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isChangeValue,
      builder: (BuildContext context, bool value, Widget? child) {
        return FilterChip(
          label: Text(
            widget.title,
            style: TextStyle(
              fontSize: 16.0, 
              fontWeight: FontWeight.w500,
              color: value ? Colors.white : Colors.black
            ),
          ),
          selected: value,
          labelPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5
          ),
          selectedColor: Colors.blue.shade400,
          backgroundColor: Colors.grey.shade200,
          showCheckmark: false,  
          onSelected: (value){
            widget.onSelected(value);
            isChangeValue.value = value;
          },
          side: BorderSide(
            color: value ? Colors.blue.shade400 : Colors.grey.shade400,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        );
      }
    );
  }
}