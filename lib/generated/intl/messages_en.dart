// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "alreadyHaveAccountMessage": MessageLookupByLibrary.simpleMessage(
      "Already have an Account ? ",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("H-Talk"),
    "chatTitle": MessageLookupByLibrary.simpleMessage("Chat"),
    "chekIsEmail": MessageLookupByLibrary.simpleMessage("Must be an email"),
    "dontHaveAccountMessage": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an Account ? ",
    ),
    "emailExist": MessageLookupByLibrary.simpleMessage(
      "This account already exist",
    ),
    "emailHint": MessageLookupByLibrary.simpleMessage("Email"),
    "inputRequiredValidator": MessageLookupByLibrary.simpleMessage(
      "This Field is required",
    ),
    "loginButton": MessageLookupByLibrary.simpleMessage("LOGIN"),
    "logoutButton": MessageLookupByLibrary.simpleMessage("LOGOUT"),
    "passwordHint": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordLength": MessageLookupByLibrary.simpleMessage(
      "Must be 8 letters at lest",
    ),
    "profileTitle": MessageLookupByLibrary.simpleMessage("Profile"),
    "sendButton": MessageLookupByLibrary.simpleMessage("Send"),
    "sendMessagehint": MessageLookupByLibrary.simpleMessage("Send message"),
    "settingsTitle": MessageLookupByLibrary.simpleMessage("Settings"),
    "signInSuccess": MessageLookupByLibrary.simpleMessage(
      "Sign in Successfully",
    ),
    "signUpNavigator": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "signUpSuccess": MessageLookupByLibrary.simpleMessage(
      "Sign up Successfully",
    ),
    "signinNavigator": MessageLookupByLibrary.simpleMessage("Sign In"),
    "signupButton": MessageLookupByLibrary.simpleMessage("SIGNUP"),
    "userNotFound": MessageLookupByLibrary.simpleMessage("User not found"),
    "weakPassword": MessageLookupByLibrary.simpleMessage("weak password"),
    "welcomeMessage": MessageLookupByLibrary.simpleMessage(
      "Welcome to H-Talk app",
    ),
    "wrongPassword": MessageLookupByLibrary.simpleMessage("Wrong Password"),
  };
}
