import 'dart:developer';

import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/cubits/chat_cubit/chat_state.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  List<MessageModel> messagesList = [];
  final CollectionReference messages = FirebaseFirestore.instance.collection(
    kMessagesCollection,
  );

  void sendMessage({required String message, required String email}) {
    try {
      if (message.trim().isEmpty) return;
      messages.add({
        kMessage: message,
        kCreatedAt: DateTime.now(),
        kEmail: email,
      });
    } catch (e) {
      log('Error sending message: $e');
    }

    log('Message sent: $message');
  }

  void getMessages() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(MessageModel.fromJson(doc));
      }

      emit(ChatSuccess());
    });
  }
}
