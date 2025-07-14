import 'package:chat_app/business_logic/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/routes/app_route.dart';
import 'package:chat_app/view/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: MaterialApp(
        locale: Locale('en'),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        title: 'H-Talk app',
        theme: themeData(),
        home: const HomeView(),
        routes: routes,
      ),
    );
  }

  ThemeData themeData() {
    return ThemeData(
      useMaterial3: false,
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: elevatedButtonThemeData(),
      inputDecorationTheme: inputDecorationTheme(),
    );
  }

  InputDecorationTheme inputDecorationTheme() {
    return const InputDecorationTheme(
      filled: true,
      fillColor: kPrimaryLightColor,
      iconColor: kPrimaryColor,
      prefixIconColor: kPrimaryColor,
      contentPadding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide.none,
      ),
    );
  }

  ElevatedButtonThemeData elevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: kPrimaryColor,
        shape: const StadiumBorder(),
        maximumSize: const Size(double.infinity, 56),
        minimumSize: const Size(double.infinity, 56),
      ),
    );
  }
}
