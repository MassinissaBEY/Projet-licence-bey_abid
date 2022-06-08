import 'package:flutter_application_6/localization/locale_constant.dart';

class LanguageData {
  final String flag;
  final String name;
  final String languageCode;

  LanguageData(this.flag, this.name, this.languageCode);

  static List<LanguageData> languageList() {
    return <LanguageData>[
      LanguageData("🇺🇸", "English", 'en'),
      LanguageData("🇩🇿", "اَلْعَرَبِيَّةُ‎", "ar"),
      LanguageData("🇫🇷", "Français", 'fr'),
    ];
  }
}