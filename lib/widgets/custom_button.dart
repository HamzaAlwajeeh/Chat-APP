import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPress,
    required this.color,
    required this.text,
    required this.textColor,
  });
  final void Function() onPress;
  final Color color;
  final String text;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: textColor,
          backgroundColor: color,
          shape: const StadiumBorder(),
          maximumSize: const Size(double.infinity, 56),
          minimumSize: const Size(double.infinity, 56),
        ),
        child: Text(text, style: TextStyle(fontSize: 18, color: textColor)),
      ),
    );
  }
}
