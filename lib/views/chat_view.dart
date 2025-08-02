import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/cubits/chat_cubit/chat_state.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final String currentEmail =
        ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          Expanded(child: _buildMessagesList(currentEmail)),
          _buildChatTextField(currentEmail),
        ],
      ),
    );
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

  Widget _buildMessagesList(String currentEmail) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        var messagesList = BlocProvider.of<ChatCubit>(context).messagesList;
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          reverse: true,
          controller: _scrollController,
          itemCount: messagesList.length,
          itemBuilder: (context, index) {
            var message = messagesList[index];
            return ChatBubble(
              messageModel: message,
              isMe: message.email == currentEmail,
            );
          },
        );
      },
    );
  }

  Widget _buildChatTextField(String currentEmail) {
    return Builder(
      builder: (context) {
        return ChatTextField(
          controller: _controller,
          onPressed: () {
            sendMesage(
              context,
              text: _controller.text,
              currentEmail: currentEmail,
            );
          },
          onSubmitted: (text) {
            sendMesage(context, text: text, currentEmail: currentEmail);
          },
        );
      },
    );
  }

  void sendMesage(
    BuildContext context, {
    required String text,
    required String currentEmail,
  }) {
    BlocProvider.of<ChatCubit>(
      context,
    ).sendMessage(message: text, email: currentEmail);
    _controller.clear();
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}
