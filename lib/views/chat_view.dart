import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  CollectionReference messages = FirebaseFirestore.instance.collection(
    kMessagesCollection,
  );
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final String currentEmail =
        ModalRoute.of(context)!.settings.arguments as String;
    return FutureBuilder<QuerySnapshot>(
      future: messages.get(),
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          List<MessageModel> messagesList = [];
          for (var message in snapShot.data!.docs) {
            messagesList.add(MessageModel.fromJson(message));
          }
          return Scaffold(
            backgroundColor: kPrimaryLightColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                S.of(context).chatTitle,
                style: TextStyle(color: kPrimaryLightColor),
              ),
              centerTitle: true,
              backgroundColor: kPrimaryColor,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return ChatBubble(
                        messageModel: messagesList[index],
                        isMe:
                            messagesList[index].email == currentEmail
                                ? true
                                : false,
                      );
                    },
                  ),
                ),
                ChatTextField(
                  controller: controller,
                  onSubmitted: (data) {
                    messages.add({
                      kMessage: data,
                      kCreatedAt: DateTime.now(),
                      kEmail: currentEmail,
                    });
                    controller.clear();
                  },
                ),
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator(color: kPrimaryColor));
        }
      },
    );
  }

  String getCurrentTime() {
    final now = DateTime.now();
    final formatter = DateFormat('hh:mm a');
    return formatter.format(now);
  }
}
