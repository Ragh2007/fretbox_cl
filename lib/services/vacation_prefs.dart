import 'package:shared_preferences/shared_preferences.dart';

class VacationPrefs {
  static Future<void> saveVacation({
    required String id,
    required String name,
    required String room,
    required String reason,
    required String desc,
    required String duration,
    required String created,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('vac_id', id);
    await prefs.setString('vac_name', name);
    await prefs.setString('vac_room', room);
    await prefs.setString('vac_reason', reason);
    await prefs.setString('vac_desc', desc);
    await prefs.setString('vac_duration', duration);
    await prefs.setString('vac_created', created);
  }

  static Future<Map<String, String>> getVacation() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'id': prefs.getString('vac_id') ?? '40288',
      'name': prefs.getString('vac_name') ?? 'Aneesha Goswami',
      'room': prefs.getString('vac_room') ?? 'QC 19, BLOCK F - 4F-189',
      'reason': prefs.getString('vac_reason') ?? 'Other',
      'desc': prefs.getString('vac_desc') ?? 'ATTENDING TECH FEST (HACKATHON)',
      'duration': prefs.getString('vac_duration') ?? '3 days, From Jan 16 To Jan 18',
      'created': prefs.getString('vac_created') ?? '13/01/2026',
    };
  }
}
