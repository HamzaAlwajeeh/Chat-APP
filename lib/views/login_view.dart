// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/gen/assets.gen.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/helper/custom_snak_bar.dart';
import 'package:chat_app/widgets/already_have_an_account.dart';
import 'package:chat_app/widgets/back_ground.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email, password;

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Background(
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
                S.of(context).loginButton,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: defaultPadding),
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 8,
                    child: SvgPicture.asset(Assets.icons.login),
                  ),
                  const Spacer(),
                ],
              ),
              CustomTextFormField(
                onChange: (data) {
                  email = data;
                },
                isPassword: false,
                hintText: S.of(context).emailHint,
                prefixIcon: Icons.person,
              ),
              CustomTextFormField(
                onChange: (data) {
                  password = data;
                },
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
                    onPress: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await logInMethod();
                          customSnakBatr(
                            context,
                            message: S.of(context).signInSuccess,
                          );

                          Navigator.popAndPushNamed(
                            context,
                            kChatView,
                            arguments: email,
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            customSnakBatr(
                              context,
                              message: S.of(context).userNotFound,
                            );
                          } else if (e.code == 'wrong-password') {
                            customSnakBatr(
                              context,
                              message: S.of(context).wrongPassword,
                            );
                          } else {
                            customSnakBatr(context, message: e.code);
                          }
                        } catch (e) {
                          customSnakBatr(context, message: e.toString());
                        }

                        isLoading = false;
                        setState(() {});
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    color: kPrimaryColor,
                    text: S.of(context).loginButton,
                    textColor: kPrimaryLightColor,
                  ),
              SizedBox(height: 3),
              AlreadyHaveAnAccount(
                login: true,
                onTap: () {
                  Navigator.popAndPushNamed(context, kSignUpView);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logInMethod() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
