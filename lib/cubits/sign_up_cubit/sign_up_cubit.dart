import 'package:chat_app/cubits/sign_up_cubit/sign_up_state.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  signUp(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      emit(SignUpFailure(errorMessage: _getErrorMessage(e, context)));
    } catch (e) {
      emit(SignUpFailure(errorMessage: e.toString()));
    }
  }

  String _getErrorMessage(FirebaseAuthException e, BuildContext context) {
    switch (e.code) {
      case 'weak-password':
        return S.of(context).weakPassword;
      case 'email-already-in-use':
        return S.of(context).emailExist;
      default:
        return e.message ?? e.code;
    }
  }
}
