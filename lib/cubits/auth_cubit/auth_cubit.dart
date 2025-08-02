import 'package:bloc/bloc.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  //Login Cubit
  UserCredential? user;
  Future<void> login(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess(user: user!));
    } on FirebaseAuthException catch (e) {
      emit(LoginFailuar(errorMessage: _getErrorMessage(e, context)));
    } catch (e) {
      emit(LoginFailuar(errorMessage: e.toString()));
    }
  }

  //SignUp Cubit
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
      case 'user-not-found':
        return S.of(context).userNotFound;
      case 'wrong-password':
        return S.of(context).wrongPassword;
      default:
        return e.message ?? e.code;
    }
  }
}
