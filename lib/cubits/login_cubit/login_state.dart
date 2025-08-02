import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserCredential user;

  LoginSuccess({required this.user});
}

class LoginFailuar extends LoginState {
  final String errorMessage;

  LoginFailuar({required this.errorMessage});
}
