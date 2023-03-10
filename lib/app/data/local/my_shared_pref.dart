// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../config/translations/localization_service.dart';

class MySharedPref {
  // get storage
  static late final _storage;

  // STORING KEYS
  static const String _fcmTokenKey = 'fcm_token';
  static const String _currentLocalKey = 'current_local';
  static const String _lightThemeKey = 'is_theme_light';
  static const String _loginUIDKey = 'uid';
  static const String _keyUserEmail = 'email';

  /// init get storage services
  static init() async {
    await GetStorage.init();
    _storage = GetStorage();
  }

  ///UID
  static Future setUID(String uid) async =>
      await _storage.write(_loginUIDKey, uid);
  static Future<String?> getUID() async => await _storage.read(_loginUIDKey);
  static Future<String?> removeUID() async =>
      await _storage.remove(_loginUIDKey);

  //Email
  static setEmail(String email) => _storage.write(_keyUserEmail, email);
  static getEmail() => _storage.read(_keyUserEmail);
  static removeEmail() => _storage.remove(_keyUserEmail);

  /// set theme current type as light theme
  static void setThemeIsLight(bool lightTheme) =>
      _storage.write(_lightThemeKey, lightTheme);

  /// get if the current theme type is light
  static bool getThemeIsLight() => _storage.read(_lightThemeKey) ?? true;

  /// save current locale
  static void setCurrentLanguage(String languageCode) =>
      _storage.write(_currentLocalKey, languageCode);

  /// get current locale
  static Locale getCurrentLocal() {
    String? langCode = _storage.read(_currentLocalKey);
    // default language is english
    if (langCode == null) {
      return LocalizationService.defaultLanguage;
    }
    return LocalizationService.supportedLanguages[langCode]!;
  }

  /// save generated fcm token
  static void setFcmToken(String token) => _storage.write(_fcmTokenKey, token);

  /// get generated fcm token
  static String? getFcmToken() => _storage.read(_fcmTokenKey);
}
