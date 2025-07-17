import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  CollectionReference messages = FirebaseFirestore.instance.collection(
    kMessagesCollection,
  );
  TextEditingController controller = TextEditingController();
  final scrolController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final String currentEmail =
        ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          List<MessageModel> messagesList = [];
          for (var message in snapShot.data!.docs) {
            messagesList.add(MessageModel.fromJson(message));
          }
          return Scaffold(
            backgroundColor: kPrimaryLightColor,
            appBar: AppBar(
              elevation: 0,
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
                    reverse: true,
                    controller: scrolController,
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
                  onPressed: () {
                    sendMessage(controller.text, currentEmail);
                    controller.clear();
                  },
                  controller: controller,
                  onSubmitted: (data) {
                    sendMessage(data, currentEmail);
                    controller.clear();
                    scrolController.animateTo(
                      0,
                      duration: Duration(microseconds: 500),
                      curve: Curves.easeIn,
                    );
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

  void sendMessage(String data, String currentEmail) {
    messages.add({
      kMessage: data,
      kCreatedAt: DateTime.now(),
      kEmail: currentEmail,
    });
  }
}
