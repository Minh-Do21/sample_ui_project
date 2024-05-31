import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sample_ui_project/data/enum_type/message_type.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/model/message_content.dart';
import '../../../data/model/message_model.dart';
import '../../../resources/barrel_const.dart';
import '../chat_screen.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_chat_types/flutter_chat_types.dart' show PreviewData;

class TextMessage extends StatefulWidget {
  const TextMessage({
    super.key,
    required this.messageModel,
  });

  final MessageModel messageModel;

  @override
  State<TextMessage> createState() => _TextMessageState();
}

class _TextMessageState extends State<TextMessage> {

  String previewUrl = "";
  Map<String, PreviewData> datas = {};

  List<MessageContent> messageContentList = [];

  @override
  void initState() {
    super.initState();
    splitLinksAndText(widget.messageModel.message);
  }

  Future<void> splitLinksAndText(String message) async{
    final urlRegex = RegExp(r'(https?:\/\/[^\s]+)');
    final matches = urlRegex.allMatches(message);

    int lastMatchEnd = 0;

    for (var match in matches) {
      if (match.start > lastMatchEnd) {
        messageContentList.add(
          MessageContent(
            content: message.substring(lastMatchEnd, match.start),
            type: MessageType.TEXT
          )
        );
      }

      messageContentList.add(
        MessageContent(
          content: match.group(0) ?? "",
          type: MessageType.LINK
        )
      );

      if(previewUrl.isEmpty){
        previewUrl = match.group(0) ?? "";
      }

      lastMatchEnd = match.end;
    }

    if (lastMatchEnd < message.length) {
      messageContentList.add(
        MessageContent(
          content: message.substring(lastMatchEnd),
          type: MessageType.TEXT
        )
      );
    }
  }

  Future<void> openUrl(String url) async{
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        constraints: BoxConstraints(
          minWidth: 0, 
          maxWidth: ChatScreenForm.getMaxWidth(),
          minHeight: 0,
          maxHeight: double.infinity
        ),
        decoration: BoxDecoration(
          color: widget.messageModel.isMySend ? COLOR_CONST.malibu : COLOR_CONST.alto.withOpacity(0.8),
          borderRadius: widget.messageModel.isMySend ?
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
        
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20
              ),
              child: messageContentWidget(),
            ),
            
            if(previewUrl.isNotEmpty)...[
              urlPreviewWidget(),
            ]
          ],
        ),
      ),
    );
  }

  Widget messageContentWidget() {
    return RichText(
      text:  TextSpan(
        text: '',
        children: messageContentList.map((MessageContent messageContent) {
          if(messageContent.type == MessageType.LINK){
            return TextSpan(
              text: messageContent.content,
              style: FONT_CONST.regular(
                fontSize: 16, 
                color:  widget.messageModel.isMySend ? COLOR_CONST.white : COLOR_CONST.black,
                textDecoration: TextDecoration.underline
              ),
              recognizer: TapGestureRecognizer()
              ..onTap = () async {
                openUrl(messageContent.content);
              },
            );
          }else{
            return TextSpan(
              text: messageContent.content,
              style: FONT_CONST.regular(
                fontSize: 16, 
                color:  widget.messageModel.isMySend ? COLOR_CONST.white : COLOR_CONST.black
              ),
            );
          }
        }).toList()
      ),
    );
  }

  Widget urlPreviewWidget() {
    return Container(
      decoration: BoxDecoration(
        color: COLOR_CONST.antiFlashWhite,
        borderRadius: widget.messageModel.isMySend ?
        const BorderRadius.only(
          bottomLeft: Radius.circular(18),
        ) : const BorderRadius.only(
          bottomRight: Radius.circular(18),
        )
      ),
      child: ClipRRect(
        borderRadius: widget.messageModel.isMySend ?
        const BorderRadius.only(
          bottomLeft: Radius.circular(18),
        ) : const BorderRadius.only(
          bottomRight: Radius.circular(18),
        ),
        child: LinkPreview(
          enableAnimation: true,
          onPreviewDataFetched: (data) {
            setState(() {
              datas = {
                ...datas,
                previewUrl: data.copyWith(
                  link: "",
                  title: data.title ?? "Không khả dụng !",
                  description: "",
                ),
              };
            });
          },
          previewData: datas[previewUrl],
          openOnPreviewTitleTap: true,
          openOnPreviewImageTap: true,
          onLinkPressed: (url) {
            openUrl(previewUrl);
          },
          text: previewUrl,
          textWidget: Container(),
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 0,
          ),
          width: double.infinity,
        ),
      ),
    );
  }
}