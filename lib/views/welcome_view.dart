import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/gen/assets.gen.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/widgets/back_ground.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/welcome_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            S.of(context).welcomeMessage,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: defaultPadding * 2),
          Row(
            children: [
              const Spacer(),
              Expanded(flex: 8, child: SvgPicture.asset(Assets.icons.chat)),
              const Spacer(),
            ],
          ),
          const SizedBox(height: defaultPadding),
          WelcomeButtons(),
          const SizedBox(height: defaultPadding),
          CustomButton(
            width: 300,
            color: kPrimaryColor,
            text: S.of(context).loginButton,
            onPress: () {
              Navigator.pushNamed(context, kLoginView);
            },
            textColor: kPrimaryLightColor,
          ),

          SizedBox(height: 16),
          CustomButton(
            width: 300,
            color: kPrimaryLightColor,
            text: S.of(context).signupButton,
            onPress: () {
              Navigator.pushNamed(context, kSignUpView);
            },
            textColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
