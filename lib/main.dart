import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/cubits/languge_cubit/language_cubit.dart';
import 'package:chat_app/cubits/languge_cubit/language_state.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/routes/app_route.dart';
import 'package:chat_app/views/welcome_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final savedLang = sharedPreferences.getString('language') ?? 'en';

  runApp(ChatApp(savedLang: savedLang));
}

class ChatApp extends StatelessWidget {
  final String savedLang;
  const ChatApp({super.key, required this.savedLang});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        // BlocProvider(create: (_) => LoginCubit()),
        // BlocProvider(create: (_) => SignUpCubit()),
        BlocProvider(
          create: (_) => LanguageCubit()..changeLanguage(language: savedLang),
        ),
        BlocProvider(create: (_) => ChatCubit()),
      ],
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          final lang = (state is LanguageChanged) ? state.language : savedLang;
          return MaterialApp(
            locale: Locale(lang),
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            title: 'H-Talk app',
            theme: themeData(),
            home: const WelcomeView(),
            routes: routes,
          );
        },
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
