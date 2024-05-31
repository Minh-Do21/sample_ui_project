import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:sample_ui_project/screens/register_bloc.dart';

import '../../../data/enum_type/message_type.dart';
import '../../../resources/barrel_const.dart';
import '../bloc/chat_bloc.dart';

class InputMessage extends StatefulWidget {
  const InputMessage({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  State<InputMessage> createState() => _InputMessageState();
}

class _InputMessageState extends State<InputMessage> {
  final textEditingController = TextEditingController();

  final ValueNotifier<String> changeMessageNoti = ValueNotifier<String>("");

  @override
  void initState() {
    super.initState();
    changeMessageNoti.value = textEditingController.text;
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  Future<void> handleSendMessage() async{
    if(textEditingController.text.isEmpty){
      return;
    }

    context.chatBloc.add(SendMesssageEvent(
        text: textEditingController.text, 
        file: null, 
        type: MessageType.TEXT
      )
    );

    textEditingController.clear();
    changeMessageNoti.value = "";

    widget.scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> pickFile() async{
    final ImagePicker picker = ImagePicker();
    final xFile = await picker.pickMedia();

    if (xFile != null) {

      final mimeType = lookupMimeType(xFile.name);
      

      final type = MessageTypeHelper.convertValue(mimeType ?? "");

      File file = File(xFile.path);

      // ignore: use_build_context_synchronously
      context.chatBloc.add(SendMesssageEvent(
        text: "", 
        file: file, 
        type: type
      )
    );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1,
              color: COLOR_CONST.athensGray,
            )
          )
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    textCapitalization: TextCapitalization.sentences,
                    minLines: 1,
                    maxLines: 4,
                    keyboardType: TextInputType.multiline,
                    controller: textEditingController,
                    autofocus: false,
                    style: FONT_CONST.regular(
                      color: COLOR_CONST.black
                    ),
                    onChanged: (value) {
                      // textEditingController.text = value;
                      changeMessageNoti.value = value;
                    },
                    textInputAction: TextInputAction.newline,
                    decoration: InputDecoration(
                      hintText: "Message ...",
                      hintStyle: FONT_CONST.regular(
                          color: COLOR_CONST.oldSilver),
                      counterText: '',
                      contentPadding: const EdgeInsets.fromLTRB(
                          15, 12, 15, 12),
                      border: outlineInputBorder,
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      disabledBorder: outlineInputBorder,
                      fillColor: COLOR_CONST.gainsboro.withOpacity(0.5),
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                ValueListenableBuilder<String>(
                  valueListenable: changeMessageNoti,
                  builder: (BuildContext context, String value, Widget? child) {
                    return CupertinoButton(
                      minSize: 0,
                      padding: const EdgeInsets.symmetric(
                        vertical: 8
                      ),
                      disabledColor: COLOR_CONST.black,
                      onPressed: value.trim().isEmpty 
                      ? null : (){
                        handleSendMessage();
                      },
                      child: Icon(
                        Icons.send_rounded,
                        size: 32,
                        color: value.trim().isEmpty ? COLOR_CONST.gainsboro : COLOR_CONST.blueYonder,
                      ),
                    );
                  }
                ),
              ],
            ),
    
            const Gap(10),
            Row(
              children: [
                ButtonAction(
                  onPressed: () {
                      pickFile();
                  },
                  title: "Gửi file",
                  icon: const Icon(
                    Icons.upload_file_outlined,
                    size: 22,
                    color: COLOR_CONST.blueYonder,
                  ),
                ),
                const Gap(10),
                ButtonAction(
                  onPressed: () {
                    
                  },
                  title: "Tin nhắn mẫu",
                  icon: const Icon(
                    Icons.message,
                    size: 22,
                    color: COLOR_CONST.blueYonder,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget ButtonAction({required Function() onPressed, required String title, required Widget icon}) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          backgroundColor: MaterialStateProperty.all<Color>(COLOR_CONST.white),
          overlayColor: MaterialStateProperty.all<Color>(Colors.grey.shade400.withOpacity(0.2)),
          side: MaterialStateProperty.all<BorderSide>(const BorderSide(
            color: COLOR_CONST.alto,
            width: 1.5
          )),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          )
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const Gap(8),
            Text(
              title,
              style: FONT_CONST.regular(
                color: COLOR_CONST.black
              ),
            ),
          ],
        ),
      ),
    );
  }
}


OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: const BorderSide(color: COLOR_CONST.athensGray));