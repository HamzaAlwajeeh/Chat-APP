import 'package:chat_app/business_logic/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:chat_app/business_logic/auth/sign_up/cubit/sign_up_state.dart';
import 'package:chat_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ElevatedButton(
            onPressed: state is SignUpLoading ? null : onPress,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              disabledBackgroundColor: kPrimaryColor,
              foregroundColor: textColor,
              backgroundColor: color,
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
            child:
                state is SignUpLoading
                    ? CircularProgressIndicator(
                      color: kPrimaryLightColor,
                      backgroundColor: kPrimaryColor,
                    )
                    : Text(
                      text,
                      style: TextStyle(fontSize: 18, color: textColor),
                    ),
          );
        },
      ),
    );
  }
}
