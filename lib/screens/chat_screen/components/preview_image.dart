import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../data/model/message_model.dart';
import '../../../resources/color_const.dart';

class PreviewImage extends StatefulWidget{

  const PreviewImage({
    super.key,
    required this.messageModel,
  });

  final MessageModel messageModel;

  @override
  State<PreviewImage> createState() => _PreviewImageState();
}

class _PreviewImageState extends State<PreviewImage> with SingleTickerProviderStateMixin{

  late TransformationController controller;

  TapDownDetails? _doubleTapDetails;

  late AnimationController animationController;

  Animation<Matrix4>? animation;

  Color backgroundColor = COLOR_CONST.white;

  @override
  void initState() {
    super.initState();
    controller = TransformationController();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
      controller.value = animation!.value;
    });

    // controller.addListener(() {
    //   print("minh Do ---- ${controller.value.row0[0]}");
    //   setState(() {
    //     backgroundColor = controller.value.row0[0] > 1 ? COLOR_CONST.black : COLOR_CONST.white;
    //   });
    // });
  }

  void clickZoomImage(){
    final position = _doubleTapDetails!.localPosition;

    const double scale = 3;
    final x = -position.dx * (scale - 1);
    final y = -position.dy * (scale - 1);

    final zoomed = Matrix4.identity()
      ..translate(x, y)
      ..scale(scale);

    final end = 
      controller.value.isIdentity() ? zoomed : Matrix4.identity();
    
    animation = Matrix4Tween(
      begin: controller.value,
      end: end,
    ).animate(
      CurveTween(curve: Curves.easeOut).animate(animationController)
    );

    animationController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "image_${widget.messageModel.id}",
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          elevation: 0,
        ),
        body: Center(
          child: GestureDetector(
            onDoubleTapDown:(details) => _doubleTapDetails = details,
            onDoubleTap: () => clickZoomImage(),
            child: InteractiveViewer(
              transformationController: controller,
              clipBehavior: Clip.none,
              panEnabled: true,
              scaleEnabled: true,
              child: widget.messageModel.urlFile.isNotEmpty 
                ? Image.network(
                  widget.messageModel.urlFile,
                ) 
                : Image.file(
                  widget.messageModel.file!,
                ),
            )
          )
        )
      ),
    );
  }
}