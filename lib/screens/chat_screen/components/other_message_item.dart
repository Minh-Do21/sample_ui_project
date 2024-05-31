import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../data/enum_type/message_type.dart';
import '../../../data/model/message_model.dart';
import 'audio_message.dart';
import 'file_message.dart';
import 'image_message.dart';
import 'text_message.dart';
import 'video_message.dart';

class OtherMessageItem extends StatelessWidget {
  const OtherMessageItem({
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipOval(
            child: Image.network(
              'https://nupet.vn/wp-content/uploads/2023/10/hinh-nen-ngo-nghinh-anh-meo-cute-nupet-new-5.jpg',
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(15),
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