// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/widgets/already_have_an_account.dart';
import 'package:chat_app/widgets/back_ground.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      topImage: 'assets/images/signup_top.png',
      isLoginView: true,
      child: SingleChildScrollView(
        child: Column(
          spacing: defaultPadding,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: defaultPadding),
            Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 8,
                  child: SvgPicture.asset("assets/icons/signup.svg"),
                ),
                const Spacer(),
              ],
            ),
            CustomTextField(
              obscureText: false,
              hintText: 'Email',
              prefixIcon: Icons.person,
            ),
            CustomTextField(
              obscureText: true,
              hintText: 'Password',
              prefixIcon: Icons.lock,
              suffixIcon: Icons.visibility,
            ),
            CustomButton(
              onPress: () {},
              color: kPrimaryColor,
              text: "SIGNUP",
              textColor: kPrimaryLightColor,
            ),
            SizedBox(height: defaultPadding),
            AlreadyHaveAnAccount(
              login: false,
              onTap: () {
                Navigator.pushNamed(context, kLoginView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
