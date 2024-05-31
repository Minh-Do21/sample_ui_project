import 'package:flutter/material.dart';
import '../../../data/model/message_model.dart';
import '../../app_router.dart';
import '../chat_screen.dart';

class ImageMessage extends StatelessWidget {
   const ImageMessage({
    super.key,
    required this.messageModel,
  });

  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "image_${messageModel.id}",
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            AppRouter.PREVIEW_IMAGE,
            arguments: messageModel
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: messageModel.urlFile.isNotEmpty 
          ? Image.network(
            messageModel.urlFile,
            width: ChatScreenForm.getMaxWidth(),
          ) 
          : Image.file(
            messageModel.file!,
            width: ChatScreenForm.getMaxWidth(),
          ),
        ),
      ),
    );
  }
}