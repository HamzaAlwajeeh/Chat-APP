import 'package:chat_app/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.obscureText,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
  });

  final bool obscureText;
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        style: TextStyle(fontWeight: FontWeight.bold, height: 1),
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(prefixIcon, color: kPrimaryColor),
          suffixIcon: Icon(suffixIcon, color: kPrimaryColor),
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: kPrimaryColor.withOpacity(0.7),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: defaultPadding + 4,
            vertical: defaultPadding + 4,
          ),
        ),
      ),
    );
  }
}
