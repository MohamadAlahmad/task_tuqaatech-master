import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tuqaatech/model/login.dart';

class MyShared {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static late SharedPreferences prefs;

  static String accessToken = '';
  static String encryptedAccessToken = '';
  static int expireInSeconds = 0;
  static int userId = 0;

  static init() async {
    prefs = await _prefs;
    accessToken = prefs.getString('token') ?? '';
    encryptedAccessToken = prefs.getString('encryptedToken') ?? '';
    expireInSeconds = prefs.getInt('expireInSeconds') ?? 0;
    userId = prefs.getInt('userId') ?? 0;
  }

  static save({LoginModel? loginModel}) {
    if (loginModel != null) {
      prefs.setString('token', loginModel.result.accessToken);
      prefs.setString('encryptedToken', loginModel.result.encryptedAccessToken);
      prefs.setInt('expireInSeconds', loginModel.result.expireInSeconds);
      prefs.setInt('userId', loginModel.result.userId);
    }
  }
}
