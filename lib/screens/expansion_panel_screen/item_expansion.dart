import 'package:flutter/material.dart';

class ItemExpansion extends StatefulWidget {
  const ItemExpansion({
    super.key,
    required this.title,
    required this.decorationBorder,
    required this.decorationMain,
    required this.children,
  });

  final Widget title;
  final BoxDecoration decorationBorder;
  final BoxDecoration decorationMain;
  final List<Widget> children;

  @override
  State<ItemExpansion> createState() => _ItemExpansionState();

  
  static List<BoxDecoration> getDecoration(int index, int length) {

    final isFirst = index == 0;
    final isLast = index == (length - 1);

    var decorationBorder =  BoxDecoration(
      color:  Colors.grey.shade50,
      border: Border(
        bottom: BorderSide(
          color: Colors.grey.shade400,
        )
      )
    );

    var decorationMain =  BoxDecoration(
      color:  Colors.grey.shade50,
    );

    if(isFirst){
      decorationBorder = BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade400,
          )
        )
      );

      decorationMain = BoxDecoration(
        color:  Colors.grey.shade50,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      );
    }else if(isLast){
      decorationBorder = const BoxDecoration(
        border: Border()
      );

      decorationMain = BoxDecoration(
        color:  Colors.grey.shade50,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      );
    }

    return [decorationBorder, decorationMain];

  }
}

class _ItemExpansionState extends State<ItemExpansion> {

  final ValueNotifier<bool> isChangeValue = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: widget.decorationMain.borderRadius ?? BorderRadius.zero,
      ),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: Container(
        decoration: widget.decorationBorder,
        child: Container(
          decoration: widget.decorationMain,
          child: ExpansionTile(
            backgroundColor: Colors.transparent,
            collapsedBackgroundColor: Colors.transparent,
            shape: const Border(
              top: BorderSide(color: Colors.transparent),
              bottom: BorderSide(color: Colors.transparent),
            ),
            trailing: ValueListenableBuilder<bool>(
              valueListenable: isChangeValue,
              builder: (BuildContext context, bool value, Widget? child) {
                return Icon(
                  value ? Icons.remove_circle_outline_outlined : Icons.add_circle_outline_outlined,
                  color: Colors.deepPurple.shade900,
                );
              }
            ),
            onExpansionChanged: (value) {
              isChangeValue.value = value;
            },
            title: widget.title,
            maintainState: true,
            children: widget.children,
          ),
        ),
      ),
    );
  }
}