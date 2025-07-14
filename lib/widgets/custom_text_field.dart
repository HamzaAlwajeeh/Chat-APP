import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/generated/l10n.dart';
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
      child: TextFormField(
        validator: (data) {
          return buildInputValisator(data, context);
        },
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
          focusedBorder: buildBorder(color: kPrimaryColor),
          contentPadding: EdgeInsets.symmetric(
            horizontal: defaultPadding + 4,
            vertical: defaultPadding + 4,
          ),
        ),
      ),
    );
  }

  String? buildInputValisator(String? data, BuildContext context) {
    if (data!.isEmpty) {
      return S.of(context).inputRequiredValidator;
    } else if (!widget.isPassword) {
      if (!data.contains("@gmail.com")) {
        return S.of(context).chekIsEmail;
      }
    } else if (data.length < 8) {
      return S.of(context).passwordLength;
    } else {
      return null;
    }
    return null;
  }

  OutlineInputBorder buildBorder({Color color = Colors.white}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: color),
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
