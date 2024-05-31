part of 'chat_bloc.dart';

abstract class ChatEvent {}

class InitDataEvent extends ChatEvent {}

class SendMesssageEvent extends ChatEvent {
  final String text;
  final File? file;
  final MessageType type;

  SendMesssageEvent({
    required this.text,
    required this.file,
    required this.type,
  });
}

class PlayMediaEvent extends ChatEvent {
  final int keyId;

  PlayMediaEvent({
    required this.keyId,
  });
}
