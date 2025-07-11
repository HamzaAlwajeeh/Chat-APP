import 'package:chat_app/constants/constants.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({
    super.key,
    required this.login,
    required this.onTap,
  });

  final bool login;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an Account ?" : 'Already have an Account ?',
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            login ? ' Sign Up' : ' Sign In',
            style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
