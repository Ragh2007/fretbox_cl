import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
  static const _nameKey = 'name';
  static const _rollKey = 'roll';
  static const _roomKey = 'room';
  static const _profilePercentKey = 'profilePercent';

  static Future<void> saveUser({
    required String name,
    required String roll,
    required String room,
    required int profilePercent,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_nameKey, name);
    await prefs.setString(_rollKey, roll);
    await prefs.setString(_roomKey, room);
    await prefs.setInt(_profilePercentKey, profilePercent);
  }

  static Future<Map<String, dynamic>> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'name': prefs.getString(_nameKey) ?? 'User',
      'roll': prefs.getString(_rollKey) ?? '--',
      'room': prefs.getString(_roomKey) ?? '--',
      'profilePercent': prefs.getInt(_profilePercentKey) ?? 0,
    };
  }
}
