import 'package:bieu_do_xe_hoi/lang/vi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('en_US', 'en_US');
  @override
  Map<String, Map<String, String>> get keys => {
        'vi': vi,
      };
}
