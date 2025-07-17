import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  final CollectionReference _messages = FirebaseFirestore.instance.collection(
    kMessagesCollection,
  );
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final String currentEmail =
        ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
      stream: _messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(color: kPrimaryColor),
          );
        }
        final messagesList =
            snapshot.data!.docs
                .map((doc) => MessageModel.fromJson(doc))
                .toList();
        return Scaffold(
          backgroundColor: kPrimaryLightColor,
          appBar: _buildAppBar(context),
          body: Column(
            children: [
              Expanded(child: _buildMessagesList(messagesList, currentEmail)),
              _buildChatTextField(currentEmail),
            ],
          ),
        );
      },
    );
  }

  void _sendMessage(String text, String email) {
    if (text.trim().isEmpty) return;
    _messages.add({kMessage: text, kCreatedAt: DateTime.now(), kEmail: email});
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Text(
        S.of(context).appTitle,
        style: const TextStyle(color: kPrimaryLightColor),
      ),
      centerTitle: true,
      backgroundColor: kPrimaryColor,
    );
  }

  Widget _buildMessagesList(
    List<MessageModel> messagesList,
    String currentEmail,
  ) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      reverse: true,
      controller: _scrollController,
      itemCount: messagesList.length,
      itemBuilder: (context, index) {
        final message = messagesList[index];
        return ChatBubble(
          messageModel: message,
          isMe: message.email == currentEmail,
        );
      },
    );
  }

  Widget _buildChatTextField(String currentEmail) {
    return ChatTextField(
      controller: _controller,
      onPressed: () {
        _sendMessage(_controller.text, currentEmail);
        _controller.clear();
      },
      onSubmitted: (text) {
        _sendMessage(text, currentEmail);
        _controller.clear();
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      },
    );
  }
}
