import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/generated/l10n.dart';
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
          login
              ? S.of(context).dontHaveAccountMessage
              : S.of(context).alreadyHaveAccountMessage,
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            login
                ? S.of(context).signUpNavigator
                : S.of(context).signinNavigator,
            style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
