import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translator/translator.dart';

final transProvider = ChangeNotifierProvider((ref) => TranslationProvider());

class TranslationProvider extends ChangeNotifier {
  String translated = 'Translated Words';
  String bhase = 'English (US)';
  void change(
      {required String text,
      required String language,
      required String lang}) async {
    bhase = language + '(' + lang + ')';
    final translation = await text.translate(from: 'en', to: lang);
    translated = translation.text;
    notifyListeners();
  }
}
