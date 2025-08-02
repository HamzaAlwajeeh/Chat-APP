import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/cubits/languge_cubit/language_cubit.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeButtons extends StatelessWidget {
  const WelcomeButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300,
          height: 56,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text(
              S.of(context).Language,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                height: 1,
                color: kPrimaryLightColor,
              ),
            ),
          ),
        ),
        const SizedBox(height: defaultPadding),
        SizedBox(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                width: 145,
                color: kPrimaryColor,
                text: S.of(context).en,
                onPress: () async {
                  changeLanguage(context, 'en');
                },
                textColor: kPrimaryLightColor,
              ),
              CustomButton(
                width: 145,
                color: kPrimaryLightColor,
                text: S.of(context).ar,
                onPress: () async {
                  changeLanguage(context, 'ar');
                },
                textColor: kPrimaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void changeLanguage(BuildContext context, String language) {
    BlocProvider.of<LanguageCubit>(context).changeLanguage(language: language);
  }
}
