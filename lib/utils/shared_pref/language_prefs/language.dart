class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;
  Language(this.id, this.flag, this.name, this.languageCode);
  static List<Language> languageList() {
    return <Language>[
      Language(0,  "πΊπΈ", "English", "en"),
        Language(1, "π·πΊ", "Russian", "ru"),
          Language(2, "πΊπΏ", "Uzbek", "uz"),
    ];
  }
}