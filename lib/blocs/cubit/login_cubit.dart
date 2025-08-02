import 'package:chat_app/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

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

  String _getErrorMessage(FirebaseAuthException e, BuildContext context) {
    switch (e.code) {
      case 'user-not-found':
        return S.of(context).userNotFound;
      case 'wrong-password':
        return S.of(context).wrongPassword;
      default:
        return e.message ?? e.code;
    }
  }
}
