import 'package:chat_app/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.isPassword,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.onChange,
  });

  final bool isPassword;
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  Function(String)? onChange;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisable = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        onChanged: widget.onChange,
        style: TextStyle(fontWeight: FontWeight.bold, height: 1),
        obscureText: widget.isPassword ? (isVisable ? false : true) : false,
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: Icon(widget.prefixIcon, color: kPrimaryColor),
          suffixIcon: widget.isPassword ? (visibilityIconButton()) : null,
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

  IconButton visibilityIconButton() {
    return IconButton(
      icon: Icon(
        isVisable ? Icons.visibility_off : Icons.visibility,
        color: kPrimaryColor,
      ),
      onPressed: () {
        setState(() {
          isVisable = !isVisable;
        });
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
    );
  }
}
