import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
    this.onSubmitted,
    required this.controller,
    this.onPressed,
  });
  final void Function(String)? onSubmitted;
  final TextEditingController controller;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        controller: controller,
        onSubmitted: onSubmitted,
        style: TextStyle(fontWeight: FontWeight.bold, height: 1),
        decoration: InputDecoration(
          contentPadding: EdgeInsetsDirectional.symmetric(
            vertical: 18,
            horizontal: 16,
          ),
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.send, color: kPrimaryColor),
          ),
          hintText: S.of(context).sendMessagehint,
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.5),
          ),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: kPrimaryColor, width: 2),
    );
  }
}
