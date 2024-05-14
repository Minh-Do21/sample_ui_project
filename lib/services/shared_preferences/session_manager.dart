import 'dart:async' show Future;
import 'package:shared_preferences/shared_preferences.dart';

// - Key for Shared Preferences
class SessionManagerKey {
  static const String TOKEN = 'TOKEN';
}

class SessionManager {
  SessionManager._privateConstructor();

  static final SessionManager share = SessionManager._privateConstructor();

  // Check authentication
  Future<bool> isAuthentication() async {
    return await getToken() != null;
  }

  // Save Token
  Future<bool> saveToken({required String token}) async {
    final myPrefs = await SharedPreferences.getInstance();
    return myPrefs.setString(SessionManagerKey.TOKEN, token);
  }

  Future<String?> getToken() async {
    final myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getString(SessionManagerKey.TOKEN);
  }

  Future<bool> removeToken() async {
    final myPrefs = await SharedPreferences.getInstance();
    return myPrefs.remove(SessionManagerKey.TOKEN);
  }
}
