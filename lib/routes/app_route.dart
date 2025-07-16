import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:chat_app/views/sign_up_view.dart';

final routes = {
  kLoginView: (_) => LoginView(),
  kSignUpView: (_) => SignUpView(),
  kChatView: (_) => ChatView(),
};
