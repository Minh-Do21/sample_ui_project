import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:sample_ui_project/data/model/message_model.dart';
import 'package:sample_ui_project/services/repository/conmon_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../data/enum_type/message_type.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(const ChatState(
      messageList: [],
      playMediaId: -1,
    )
  ) {
    on<InitDataEvent>(_onInitDataEvent);
    on<SendMesssageEvent>(_sendMesssageEvent);
    on<PlayMediaEvent>(_playMediaEvent);
  }

  final commonRepository = CommonRepository();

  List<MessageModel> awaitListMessage = [];

  int indexCheck = -1;

  Future<void> _onInitDataEvent(InitDataEvent event, Emitter<ChatState> emit) async {
    final messageList = [
      const MessageModel(
        id: 1, 
        type: MessageType.TEXT, 
        message: "Xin chào bạn, tôi có thể giúp gì cho bạn!", 
        urlFile: "", 
        isSeen: false, 
        isMySend: false,
        isSending: false,
      ),
      const MessageModel(
        id: 2, 
        type: MessageType.TEXT, 
        message: "Tôi cần tư vấn việc làm", 
        urlFile: "", 
        isSeen: false, 
        isMySend: true,
        isSending: false,
      ),
      const MessageModel(
        id: 3, 
        type: MessageType.IMAGE, 
        message: "", 
        urlFile: "https://media.macphun.com/img/uploads/customer/how-to/608/15542038745ca344e267fb80.28757312.jpg?q=85&w=1340", 
        isSeen: false, 
        isMySend: false,
        isSending: false,
      ),
      const MessageModel(
        id: 4, 
        type: MessageType.VIDEO, 
        message: "", 
        urlFile: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", 
        isSeen: false, 
        isMySend: false,
        isSending: false,
      ),
       const MessageModel(
        id: 5, 
        type: MessageType.VIDEO, 
        message: "", 
        urlFile: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4", 
        isSeen: false, 
        isMySend: true,
        isSending: false,
      ),
       const MessageModel(
        id: 6, 
        type: MessageType.VIDEO, 
        message: "", 
        urlFile: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4", 
        isSeen: false, 
        isMySend: true,
        isSending: false,
      ),
      const MessageModel(
        id: 7, 
        type: MessageType.VIDEO, 
        message: "", 
        urlFile: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4", 
        isSeen: false, 
        isMySend: true,
        isSending: false,
      ),
      const MessageModel(
        id: 8, 
        type: MessageType.AUDIO, 
        message: "", 
        urlFile: "https://www2.cs.uic.edu/~i101/SoundFiles/PinkPanther30.wav", 
        isSeen: false, 
        isMySend: false,
        isSending: false,
      ),
      const MessageModel(
        id: 9, 
        type: MessageType.FILE, 
        message: "", 
        urlFile: "https://example-files.online-convert.com/document/txt/example.txt", 
        isSeen: false, 
        isMySend: true,
        isSending: false,
      ),
      const MessageModel(
        id: 10, 
        type: MessageType.FILE, 
        message: "", 
        // urlFile: "https://www.orimi.com/pdf-test.pdf", 
        // urlFile: "https://www.cmu.edu/blackboard/files/evaluate/tests-example.xls",
        urlFile: "https://calibre-ebook.com/downloads/demos/demo.docx",
        isSeen: false, 
        isMySend: false,
        isSending: false,
      ),
      const MessageModel(
        id: 11, 
        type: MessageType.TEXT, 
        message: "https://www.youtube.com/watch?v=r2SxPidOfng https://www.youtube.com/watch?v=r2SxPidOfng test", 
        urlFile: "",
        isSeen: false, 
        isMySend: true,
        isSending: false,
      ),
      // const MessageModel(
      //   id: 12, 
      //   type: MessageType.TEXT, 
      //   message: "http://www.youtube.com/watch?v=s_agS0GP-wU https://shopee.vn/", 
      //   urlFile: "",
      //   isSeen: false, 
      //   isMySend: false,
      //   isSending: false,
      // ),
    ];

    emit(
      state.copyWith(
        messageList: messageList
      )
    );
  }

  Future<void> _sendMesssageEvent(SendMesssageEvent event, Emitter<ChatState> emit) async {

    final listMessage = [...state.messageList];

    final message = MessageModel(
      id: listMessage.length + 1, 
      type: event.type, 
      message: event.text, 
      urlFile: "", 
      file: event.file,
      isSeen: false, 
      isMySend: true, 
      isSending: true
    );
      
    listMessage.add(message);
    awaitListMessage.add(message);

    emit(
      state.copyWith(
        messageList: listMessage
      )
    );

    await initSocketCallback(emit, message);
  }

  Future<void> _playMediaEvent(PlayMediaEvent event, Emitter<ChatState> emit) async {
    if(indexCheck != event.keyId){
      emit(
        state.copyWith(
          playMediaId: indexCheck
        )
      );
    }

    indexCheck = event.keyId;
  }

  Future<void> initSocketCallback(Emitter<ChatState> emit, MessageModel message)async{
    //Giả lập phản hồi của socket
      await Future.delayed(const Duration(seconds: 3)).then((value) {
      
        final messageUpdate = awaitListMessage.firstWhere((awaitMessage) => awaitMessage.id == message.id).copyWith(isSending: false);

        awaitListMessage.removeWhere((element) => element.id == message.id);

        List<MessageModel> updatedListMessage = [...state.messageList];

        int index = updatedListMessage.indexWhere((item) => item.id == message.id);

        updatedListMessage[index] = messageUpdate;

        emit(
          state.copyWith(
            messageList: updatedListMessage
          )
        );
      });
  }
}
