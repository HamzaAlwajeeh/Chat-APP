// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `H-Talk`
  String get appTitle {
    return Intl.message('H-Talk', name: 'appTitle', desc: '', args: []);
  }

  /// `Welcome to H-Talk app`
  String get welcomeMessage {
    return Intl.message(
      'Welcome to H-Talk app',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `LOGIN`
  String get loginButton {
    return Intl.message('LOGIN', name: 'loginButton', desc: '', args: []);
  }

  /// `SIGNUP`
  String get signupButton {
    return Intl.message('SIGNUP', name: 'signupButton', desc: '', args: []);
  }

  /// `LOGOUT`
  String get logoutButton {
    return Intl.message('LOGOUT', name: 'logoutButton', desc: '', args: []);
  }

  /// `Settings`
  String get settingsTitle {
    return Intl.message('Settings', name: 'settingsTitle', desc: '', args: []);
  }

  /// `Profile`
  String get profileTitle {
    return Intl.message('Profile', name: 'profileTitle', desc: '', args: []);
  }

  /// `Chat`
  String get chatTitle {
    return Intl.message('Chat', name: 'chatTitle', desc: '', args: []);
  }

  /// `Send`
  String get sendButton {
    return Intl.message('Send', name: 'sendButton', desc: '', args: []);
  }

  /// `Email`
  String get emailHint {
    return Intl.message('Email', name: 'emailHint', desc: '', args: []);
  }

  /// `Password`
  String get passwordHint {
    return Intl.message('Password', name: 'passwordHint', desc: '', args: []);
  }

  /// `Don't have an Account ? `
  String get dontHaveAccountMessage {
    return Intl.message(
      'Don\'t have an Account ? ',
      name: 'dontHaveAccountMessage',
      desc: '',
      args: [],
    );
  }

  /// `Already have an Account ? `
  String get alreadyHaveAccountMessage {
    return Intl.message(
      'Already have an Account ? ',
      name: 'alreadyHaveAccountMessage',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signinNavigator {
    return Intl.message('Sign In', name: 'signinNavigator', desc: '', args: []);
  }

  /// `Sign Up`
  String get signUpNavigator {
    return Intl.message('Sign Up', name: 'signUpNavigator', desc: '', args: []);
  }

  /// `weak password`
  String get weakPassword {
    return Intl.message(
      'weak password',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `This account already exist`
  String get emailExist {
    return Intl.message(
      'This account already exist',
      name: 'emailExist',
      desc: '',
      args: [],
    );
  }

  /// `Sign up Successfully`
  String get signUpSuccess {
    return Intl.message(
      'Sign up Successfully',
      name: 'signUpSuccess',
      desc: '',
      args: [],
    );
  }

  /// `This Field is required`
  String get inputRequiredValidator {
    return Intl.message(
      'This Field is required',
      name: 'inputRequiredValidator',
      desc: '',
      args: [],
    );
  }

  /// `Must be 8 letters at lest`
  String get passwordLength {
    return Intl.message(
      'Must be 8 letters at lest',
      name: 'passwordLength',
      desc: '',
      args: [],
    );
  }

  /// `Must be an email`
  String get chekIsEmail {
    return Intl.message(
      'Must be an email',
      name: 'chekIsEmail',
      desc: '',
      args: [],
    );
  }

  /// `Sign in Successfully`
  String get signInSuccess {
    return Intl.message(
      'Sign in Successfully',
      name: 'signInSuccess',
      desc: '',
      args: [],
    );
  }

  /// `User not found`
  String get userNotFound {
    return Intl.message(
      'User not found',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Wrong Password`
  String get wrongPassword {
    return Intl.message(
      'Wrong Password',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `Send message`
  String get sendMessagehint {
    return Intl.message(
      'Send message',
      name: 'sendMessagehint',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message('Language', name: 'Language', desc: '', args: []);
  }

  /// `English`
  String get en {
    return Intl.message('English', name: 'en', desc: '', args: []);
  }

  /// `العربية`
  String get ar {
    return Intl.message('العربية', name: 'ar', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
