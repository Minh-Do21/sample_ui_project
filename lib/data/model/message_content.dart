import '../enum_type/message_type.dart';

class MessageContent {
  final String content;
  final MessageType type;

  const MessageContent({
    required this.content,
    required this.type,
  });
}