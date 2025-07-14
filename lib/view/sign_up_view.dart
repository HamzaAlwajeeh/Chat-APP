import 'package:chat_app/business_logic/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:chat_app/business_logic/auth/sign_up/cubit/sign_up_state.dart';
import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/widgets/already_have_an_account.dart';
import 'package:chat_app/widgets/back_ground.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_snak_bar.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  @override
  Widget build(BuildContext context) {
    return Background(
      topImage: 'assets/images/signup_top.png',
      isLoginView: true,
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) async {
          if (state is SignUpSuccess) {
            customSnakBatr(
              context,
              message: S.of(context).signUpSuccess,
              isSuccess: true,
            );
            // Navigator.popAndPushNamed(context, kSignUpView);
          } else if (state is SignUpFailure) {
            if (state.message == 'weak-password') {
              customSnakBatr(context, message: S.of(context).weakPassword);
            } else if (state.message == 'email-already-in-use') {
              customSnakBatr(
                context,
                message: S.of(context).emailExist,
                isSuccess: true,
              );
            } else {
              customSnakBatr(context, message: state.message);
            }
          }
        },
        builder: (context, state) {
          return Form(
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
                        child: SvgPicture.asset("assets/icons/signup.svg"),
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
                  CustomButton(
                    color: kPrimaryColor,
                    text: S.of(context).signupButton,
                    textColor: kPrimaryLightColor,
                    onPress: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<SignUpCubit>(
                          context,
                        ).signUpMethod(email: email!, password: password!);
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
          );
        },
      ),
    );
  }
}
