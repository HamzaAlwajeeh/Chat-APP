import 'package:chat_app/cubits/languge_cubit/language_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());
  String? appLanguage;

  void changeLanguage({required String language}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("language", language);
    appLanguage = language;
    emit(LanguageChanged(language: language));
  }
}
