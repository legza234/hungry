
import 'dart:core';

import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  static const String tokeKey ='outh token';

  static Future<void> saveToken(String token) async {
    final  prefs = await SharedPreferences.getInstance();
    await prefs.setString(tokeKey, token);
  }

  static Future<String?> getToken() async {
    final  prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokeKey);

  }

  static Future<void> clearToken() async {
    final  prefs = await SharedPreferences.getInstance();
     prefs.remove(tokeKey);
  }

}