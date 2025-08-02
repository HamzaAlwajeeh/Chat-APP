import 'package:chat_app/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.onPress,
    required this.color,
    required this.text,
    required this.textColor,
    required this.width,
  });
  void Function() onPress;
  Color color;
  String text;
  Color textColor;
  double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          disabledBackgroundColor: kPrimaryColor,
          foregroundColor: textColor,
          backgroundColor: color,
          maximumSize: const Size(double.infinity, 56),
          minimumSize: const Size(double.infinity, 56),
        ),
        child: Text(text, style: TextStyle(fontSize: 18, color: textColor)),
      ),
    );
  }
}
