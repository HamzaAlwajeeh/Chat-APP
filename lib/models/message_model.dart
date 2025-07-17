import 'package:chat_app/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String message;
  final String email;
  final DateTime time;

  MessageModel({
    required this.message,
    required this.time,
    required this.email,
  });

  factory MessageModel.fromJson(json) {
    return MessageModel(
      message: json[kMessage] ?? '',
      email: json[kEmail] ?? '',
      time: (json[kCreatedAt] as Timestamp).toDate(),
    );
  }
}
