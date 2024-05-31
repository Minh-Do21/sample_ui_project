import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sample_ui_project/resources/barrel_const.dart';
import '../../../data/argument/browser_argument.dart';
import '../../../data/model/message_model.dart';
import '../../app_router.dart';
import '../chat_screen.dart';

class FileMessage extends StatelessWidget{
  const FileMessage({
    super.key,
    required this.messageModel,
  });

  final MessageModel messageModel;

  String getFileNameFromPath(String path) {
    List<String> parts = path.split('/');
    return parts.isNotEmpty ? parts.last : '';
  }

  Future<void> preViewFile(BuildContext context) async {
    if(messageModel.urlFile.isNotEmpty){
      final url = 'https://docs.google.com/viewer?url=${Uri.encodeComponent(messageModel.urlFile)}&embedded=true';

      Navigator.of(context).pushNamed(
        AppRouter.BROWSER_SCREEN,
        arguments: BrowserArgument(
            title: getFileNameFromPath(messageModel.urlFile),
            url: url,
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        preViewFile(context);
      },
      child: Container(
        constraints: BoxConstraints(
            minWidth: 0, 
            maxWidth: ChatScreenForm.getMaxWidth(),
            minHeight: 0,
            maxHeight: double.infinity
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20
          ),
          decoration: BoxDecoration(
            color: messageModel.isMySend ? COLOR_CONST.malibu : COLOR_CONST.alto.withOpacity(0.8),
            borderRadius: messageModel.isMySend ?
            const BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
              bottomLeft: Radius.circular(18),
            ) : const BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
              bottomRight: Radius.circular(18),
            )
          ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: COLOR_CONST.white,
                borderRadius: BorderRadius.all(Radius.circular(50))
              ),
              padding: const EdgeInsets.all(10),
              child: const Icon(
                Icons.file_copy,
                color: COLOR_CONST.davyGrey,
                size: 22,
              ),
            ),
            const Gap(10),
            Flexible(
              child: Text(
                getFileNameFromPath(
                  messageModel.urlFile.isNotEmpty
                  ? messageModel.urlFile : (messageModel.file?.path ?? "")
                ),
                style: FONT_CONST.regular(
                  fontSize: 16, 
                  color: messageModel.isMySend ? COLOR_CONST.white : COLOR_CONST.black
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}