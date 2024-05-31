part of 'chat_bloc.dart';

class ChatState extends Equatable {
  final List<MessageModel> messageList;
  final int playMediaId;

  const ChatState({
    required this.messageList,
    required this.playMediaId,
  });

  ChatState copyWith({
    List<MessageModel>? messageList,
    int? playMediaId,
  }) {
    return ChatState(
      messageList: messageList ?? this.messageList,
      playMediaId: playMediaId ?? this.playMediaId,
    );
  }

  @override
  List<Object?> get props => [
    messageList,
    playMediaId,
  ];
}
