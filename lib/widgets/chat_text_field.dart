import 'package:chat_app/constants/constants.dart';
import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        style: TextStyle(fontWeight: FontWeight.bold, height: 1),
        decoration: InputDecoration(
          contentPadding: EdgeInsetsDirectional.symmetric(
            vertical: 18,
            horizontal: 16,
          ),
          suffixIcon: Icon(Icons.send, color: kPrimaryColor),
          hintText: "Send message",
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
