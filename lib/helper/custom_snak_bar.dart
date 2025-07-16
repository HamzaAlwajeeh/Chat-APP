import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:flutter/material.dart';

void customSnakBatr(
  BuildContext context, {
  required String message,
  bool isSuccess = false,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      // duration: Duration(seconds: 5),
      behavior: SnackBarBehavior.floating,
      elevation: 2,
      width: MediaQuery.of(context).size.width - 30,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: kPrimaryColor,
      padding: EdgeInsets.all(isSuccess ? 10 : 20),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: kPrimaryLightColor,
        ),
      ),
      action:
          isSuccess
              ? SnackBarAction(
                label: S.of(context).signinNavigator,
                onPressed: () {
                  Navigator.popAndPushNamed(context, kLoginView);
                },
                textColor: kPrimaryColor,
                backgroundColor: kPrimaryLightColor,
              )
              : null,
    ),
  );
}
