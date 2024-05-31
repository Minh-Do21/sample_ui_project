// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:equatable/equatable.dart';

import '../enum_type/message_type.dart';

class MessageModel extends Equatable{
  final int id;
  final MessageType type;
  final String message;
  final File? file;
  final String urlFile;
  final bool isSeen;
  final bool isMySend;
  final bool isSending;

  const MessageModel({
    required this.id,
    required this.type,
    required this.message,
    this.file,
    required this.urlFile,
    required this.isSeen,
    required this.isMySend,
    required this.isSending,
  });

  MessageModel copyWith({
    bool? isSending,
  }) {
    return MessageModel(
      id: id, 
      type: type,
      message: message, 
      urlFile: urlFile, 
      file: file,
      isSeen: isSeen, 
      isMySend: isMySend, 
      isSending: isSending ?? this.isSending,
    );
  }
  
  @override
  List<Object?> get props => [
    id,
    type,
    message,
    file,
    urlFile,
    isSeen,
    isMySend,
    isSending,
  ];
}