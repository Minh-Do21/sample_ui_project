// ignore_for_file: constant_identifier_names

enum MessageType {
  TEXT,
  IMAGE,
  VIDEO,
  AUDIO,
  FILE,
  LINK
}

extension MessageTypeExtension on MessageType {
  int get type {
    switch (this) {
      case MessageType.TEXT:
        return 1;
      case MessageType.IMAGE:
        return 2;
      case MessageType.VIDEO:
        return 3;
      case MessageType.AUDIO:
        return 4;
      case MessageType.FILE:
        return 5;
      case MessageType.LINK:
        return 6;
      default:
        return 0;
    }
  }

  String get value {
    switch (this) {
      case MessageType.TEXT:
        return 'text';
      case MessageType.IMAGE:
        return 'image';
      case MessageType.VIDEO:
        return 'video';
      case MessageType.AUDIO:
        return 'audio';
      case MessageType.FILE:
        return 'file';
      case MessageType.LINK:
        return 'link';
      default:
        return '';
    }
  }
}

class MessageTypeHelper {
  static MessageType convertValue(String value) {
    if (value.startsWith(MessageType.IMAGE.value)) {
      return MessageType.IMAGE;
    }else if (value.startsWith(MessageType.VIDEO.value)) {
      return MessageType.VIDEO;
    }else if (value.startsWith(MessageType.AUDIO.value)) {
      return MessageType.AUDIO;
    }else {
      return MessageType.FILE;
    }
  }
}