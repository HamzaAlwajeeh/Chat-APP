// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  UserCredential user;
  SignUpSuccess({required this.user});
}

class SignUpFailure extends SignUpState {
  final String message;

  SignUpFailure({required this.message});
}
