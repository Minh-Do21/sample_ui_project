import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sample_ui_project/screens/chat_screen/components/audio_message.dart';
import '../../../data/enum_type/message_type.dart';
import '../../../data/model/message_model.dart';
import '../../../resources/barrel_const.dart';
import 'file_message.dart';
import 'image_message.dart';
import 'text_message.dart';
import 'video_message.dart';

class MyMessageItem extends StatelessWidget {
  const MyMessageItem({
    super.key,
    required this.messageModel,
  });

  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 11,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if(messageModel.isSeen)...[
            Text(
              "Đã xem",
              style: FONT_CONST.regular(fontSize: 14, color: COLOR_CONST.lineGrey),
            ),
            const Gap(15),
          ]
          else if(messageModel.isSending)...[
            Text(
              "Đang gửi",
              style: FONT_CONST.regular(fontSize: 14, color: COLOR_CONST.lineGrey),
            ),
            const Gap(15),
          ],
          
          if(messageModel.type == MessageType.TEXT)...[
            TextMessage(
              messageModel: messageModel
            ),
          ]else if(messageModel.type == MessageType.IMAGE)...[
            ImageMessage(messageModel: messageModel)
          ]else if(messageModel.type == MessageType.VIDEO)...[
            VideoMessage(
              messageModel: messageModel,
            )
          ]else if(messageModel.type == MessageType.AUDIO)...[
            AudioMessage(
              messageModel: messageModel,
            )
          ]else if(messageModel.type == MessageType.FILE)...[
            FileMessage(
              messageModel: messageModel,
            )
          ]
        ],
      ),
    );
  }
}