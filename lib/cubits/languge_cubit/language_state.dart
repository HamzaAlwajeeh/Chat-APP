abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class LanguageChanged extends LanguageState {
  final String language;

  LanguageChanged({required this.language});
}
