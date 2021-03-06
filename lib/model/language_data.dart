import 'package:flutter_application_6/localization/locale_constant.dart';

class LanguageData {
  final String flag;
  final String name;
  final String languageCode;

  LanguageData(this.flag, this.name, this.languageCode);

  static List<LanguageData> languageList() {
    return <LanguageData>[
      LanguageData("๐บ๐ธ", "English", 'en'),
      LanguageData("๐ฉ๐ฟ", "ุงูููุนูุฑูุจููููุฉูโ", "ar"),
      LanguageData("๐ซ๐ท", "Franรงais", 'fr'),
    ];
  }
}