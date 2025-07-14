import 'package:chat_app/business_logic/auth/sign_up/cubit/sign_up_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  signUpMethod({required String email, required String password}) async {
    try {
      emit(SignUpLoading());
      UserCredential user = await userRegisterMethod(
        inputEmail: email,
        inputPassword: password,
      );
      emit(SignUpSuccess(user: user));
    } on FirebaseAuthException catch (e) {
      emit(SignUpFailure(message: e.code));
    } catch (e) {
      emit(SignUpFailure(message: e.toString()));
    }
  }

  Future<UserCredential> userRegisterMethod({
    required String inputEmail,
    required String inputPassword,
  }) async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: inputEmail,
          password: inputPassword,
        );
    return user;
  }
}
