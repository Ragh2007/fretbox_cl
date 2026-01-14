import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  /* ---------- PROFILE ---------- */

  static Future<void> saveProfile({
    required String name,
    required String rollNo,
    required String room,
    required String phone,
    required String email,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('rollNo', rollNo);
    await prefs.setString('room', room);
    await prefs.setString('phone', phone);
    await prefs.setString('email', email);
  }

  static Future<Map<String, String>> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'name': prefs.getString('name') ?? '',
      'rollNo': prefs.getString('rollNo') ?? '',
      'room': prefs.getString('room') ?? '',
      'phone': prefs.getString('phone') ?? '',
      'email': prefs.getString('email') ?? '',
    };
  }

  static Future<void> clearProfile() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('name');
    await prefs.remove('rollNo');
    await prefs.remove('room');
    await prefs.remove('phone');
    await prefs.remove('email');
  }
}
