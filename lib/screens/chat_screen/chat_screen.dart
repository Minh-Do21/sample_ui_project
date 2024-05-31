import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sample_ui_project/resources/barrel_const.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import '../../configs/size_config.dart';
import '../../data/model/message_model.dart';
import 'bloc/chat_bloc.dart';
import 'components/input_message.dart';
import 'components/my_message_item.dart';
import 'components/other_message_item.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc()..add(InitDataEvent()),
      child: ChatScreenForm(),
    );
  }

}

class ChatScreenForm extends StatefulWidget {
  ChatScreenForm({
    super.key,
  });

  static double getMaxWidth(){
    return (SizeConfig.screenWidth * 0.7) - 15;
  }

  @override
  State<ChatScreenForm> createState() => _ChatScreenFormState();
}

class _ChatScreenFormState extends State<ChatScreenForm> {

  final ScrollController _scrollController = ScrollController();

  // double positionPlay = -1;

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  void initState() {
    super.initState();
    permissionStorage();
  }

  Future<void> permissionStorage() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      // BlocProvider.of<DashboardBloc>(context).add(GetListMusicEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        backgroundColor: COLOR_CONST.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: COLOR_CONST.white,
          leading: CupertinoButton(
            minSize: 0,
            padding: EdgeInsets.zero,
            onPressed: (){
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 20,
              color: COLOR_CONST.lineGrey,
            ),
          ),
          title: Text(
            "Intro Popup djshd dhsajl dhsd dhas jhdas h",
            style: FONT_CONST.bold(fontSize: 16, color: COLOR_CONST.black),
          ),
          centerTitle: true,
          actions:  [
            CupertinoButton(
              minSize: 0,
              padding: EdgeInsets.zero,
              onPressed: (){
                
              },
              child: const Icon(
                Icons.info,
                size: 20,
                color: COLOR_CONST.lineGrey,
              ),
            ),
            const Gap(20)
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: BlocBuilder<ChatBloc, ChatState>(
                  buildWhen: (previous, current) => 
                    previous.messageList != current.messageList,
                  builder: (context, state) {
                    return  SingleChildScrollView(
                      padding: const EdgeInsets.only(
                        top: 25,
                        left: 10,
                        right: 10
                      ),
                      reverse: true,
                      controller: _scrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        children: state.messageList.map(
                          (MessageModel messageModel) {
                            // return OtherMessageItem();
                            if(messageModel.isMySend){
                              return MyMessageItem(
                                messageModel: messageModel,
                              );
                            }else{
                              return OtherMessageItem(
                                messageModel: messageModel,
                              );
                            }
                          }
                        ).toList(),
                      )
                    );
                  }
                ),
                
               
              ),
            ),
            InputMessage(
              scrollController: _scrollController,
            )
          ]
        ),
      ),
    );
  }
}