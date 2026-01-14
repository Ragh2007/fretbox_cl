import 'package:flutter/material.dart';
import 'package:fretbox/services/vacation_prefs.dart';
class EditVacationPage extends StatefulWidget {
  final Map<String, String> initial;
  const EditVacationPage({super.key, required this.initial});

  @override
  State<EditVacationPage> createState() => _EditVacationPageState();
}

class _EditVacationPageState extends State<EditVacationPage> {
  late TextEditingController id, name, room, reason, desc, duration, created;

  @override
  void initState() {
    super.initState();
    id = TextEditingController(text: widget.initial['id']);
    name = TextEditingController(text: widget.initial['name']);
    room = TextEditingController(text: widget.initial['room']);
    reason = TextEditingController(text: widget.initial['reason']);
    desc = TextEditingController(text: widget.initial['desc']);
    duration = TextEditingController(text: widget.initial['duration']);
    created = TextEditingController(text: widget.initial['created']);
  }

  Future<void> _save() async {
    await VacationPrefs.saveVacation(
      id: id.text,
      name: name.text,
      room: room.text,
      reason: reason.text,
      desc: desc.text,
      duration: duration.text,
      created: created.text,
    );
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Vacation')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _field('ID', id),
            _field('Name', name),
            _field('Room', room),
            _field('Reason', reason),
            _field('Description', desc),
            _field('Duration', duration),
            _field('Created At', created),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _save,
              child: const Text('Save Changes'),
            )
          ],
        ),
      ),
    );
  }

  Widget _field(String label, TextEditingController c) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: c,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }
}
