import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  ///keys
  static String token = "authToken";
  static String userId = "userId";

  SharedPreference._();

  static final SharedPreference _instance = SharedPreference._();

  factory SharedPreference() {
    return _instance;
  }

  SharedPreferences? preferences;

  initialize() async {
    try {
      preferences = await SharedPreferences.getInstance();
    } catch (e, s) {
      debugPrint("Data11 SharedPreferences error $e $s");
    }
  }

  String? get authToken => preferences?.getString(token) ?? "";

  String? get getUserId => preferences?.getString(userId) ?? "";

  setUserAuthToken(String userToken) async {
    await preferences?.setString(token, userToken);
  }

  setUserId(String id) async {
    await preferences?.setString(userId, id);
  }
}
