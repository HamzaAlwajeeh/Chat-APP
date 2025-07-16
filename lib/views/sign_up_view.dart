import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/gen/assets.gen.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/helper/custom_snak_bar.dart';
import 'package:chat_app/widgets/already_have_an_account.dart';
import 'package:chat_app/widgets/back_ground.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String? email;
  String? password;

  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Background(
      topImage: 'assets/images/signup_top.png',
      isLoginView: true,
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: SingleChildScrollView(
          child: Column(
            spacing: defaultPadding,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).signupButton,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: defaultPadding),
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 8,
                    child: SvgPicture.asset(Assets.icons.signup),
                  ),
                  const Spacer(),
                ],
              ),
              CustomTextField(
                onChange: (data) => email = data,
                isPassword: false,
                hintText: S.of(context).emailHint,
                prefixIcon: Icons.person,
              ),
              CustomTextField(
                onChange: (data) => password = data,
                isPassword: true,
                hintText: S.of(context).passwordHint,
                prefixIcon: Icons.lock,
                suffixIcon: Icons.visibility,
              ),
              isLoading
                  ? CircularProgressIndicator(
                    color: kPrimaryLightColor,
                    backgroundColor: kPrimaryColor,
                  )
                  : CustomButton(
                    color: kPrimaryColor,
                    text: S.of(context).signupButton,
                    textColor: kPrimaryLightColor,
                    onPress: () async {
                      if (formKey.currentState!.validate()) {
                        await buildSignUp(context);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  ),
              const SizedBox(height: 3),
              AlreadyHaveAnAccount(
                login: false,
                onTap: () {
                  Navigator.popAndPushNamed(context, kLoginView);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> buildSignUp(BuildContext context) async {
    isLoading = true;
    setState(() {});
    try {
      await signUpMethod();
      customSnakBatr(context, message: S.of(context).signUpSuccess);

      Navigator.popAndPushNamed(context, kLoginView);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        customSnakBatr(context, message: S.of(context).weakPassword);
      } else if (e.code == 'email-already-in-use') {
        customSnakBatr(
          context,
          message: S.of(context).emailExist,
          isSuccess: true,
        );
      } else {
        customSnakBatr(context, message: e.code);
      }
    } catch (e) {
      customSnakBatr(context, message: e.toString());
    }
    isLoading = false;
    setState(() {});
  }

  Future<void> signUpMethod() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
