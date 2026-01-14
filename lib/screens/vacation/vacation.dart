import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './edit_vacation.dart';

class MyVacationsPage extends StatefulWidget {
  const MyVacationsPage({super.key});

  @override
  State<MyVacationsPage> createState() => _MyVacationsPageState();
}

class _MyVacationsPageState extends State<MyVacationsPage> {
  int selectedTab = 0;

  final tabs = ["Pending", "Approved", "Expired", "Complete", "Rej/Can"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 44, 150, 253),
        elevation: 0,
        toolbarHeight: 120,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () => setState(() {}),
          )
        ],
        centerTitle: true,
        title: const Column(
          children: [
            Text(
              "Profile Image not set",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 4),
            Text(
              "My Vacations",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(tabs.length, (index) {
                return GestureDetector(
                  onTap: () => setState(() => selectedTab = index),
                  child: Text(
                    tabs[index],
                    style: TextStyle(
                      color: selectedTab == index
                          ? Colors.white
                          : Colors.white70,
                      fontWeight: selectedTab == index
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),

      /* ================= BODY ================= */

      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 90),
        child: selectedTab == 0
            ? const VacationCard()
            : const Center(
                child: Text(
                  "You haven't raised any Vacation!",
                  style: TextStyle(color: Color.fromARGB(200, 0, 0, 0)),
                ),
              ),
      ),
    );
  }
}

/* ================= VACATION CARD ================= */

class VacationCard extends StatefulWidget {
  const VacationCard({super.key});

  @override
  State<VacationCard> createState() => _VacationCardState();
}

class _VacationCardState extends State<VacationCard> {
  late Map<String, String> data;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      data = {
        'id': prefs.getString('vac_id') ?? '40288',
        'name': prefs.getString('vac_name') ?? 'User',
        'room': prefs.getString('vac_room') ??
            'QC 19, BLOCK F - 4F-189',
        'reason': prefs.getString('vac_reason') ?? 'Other',
        'desc': prefs.getString('vac_desc') ??
            'ATTENDING TECH FEST (HACKATHON)',
        'duration': prefs.getString('vac_duration') ??
            '3 days, From Jan 16 To Jan 18',
        'created': prefs.getString('vac_created') ?? '13/01/2026',
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) return const SizedBox();

    return Card(
      margin: const EdgeInsets.only(bottom: 30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['name']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_city,
                        size: 16, color: Colors.grey),
                    const SizedBox(width: 6),
                    Expanded(child: Text(data['room']!)),
                  ],
                ),
                label("Reason"),
                value(data['reason']!),
                label("Description"),
                value(data['desc']!),
                label("Duration"),
                value(data['duration']!),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Icon(Icons.notifications_active,
                        size: 16, color: Colors.red),
                    SizedBox(width: 6),
                    Text("Urgent? : No"),
                  ],
                ),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Text("Mentor Approval: "),
                    Text("APPROVED",
                        style: TextStyle(color: Colors.green)),
                  ],
                ),
                const SizedBox(height: 4),
                const Wrap(
                  spacing: 4,
                  children: [
                    Text("Parent's Permission"),
                    Text("Approved",
                        style: TextStyle(color: Colors.green)),
                    Text("(At 13 Jan 07:06 PM)"),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2196F3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.show_chart),
                        label: const Text(
                          "Track Whatsapp Notification",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () {},
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Created At: ${data['created']}",
                    style: const TextStyle(
                        fontSize: 12, color: Colors.grey),
                  ),
                )
              ],
            ),

            /* ===== ONLY CHANGE: CLICKABLE ID ===== */

            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () async {
                  final updated = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EditVacationPage(initial: data),
                    ),
                  );
                  if (updated == true) _load();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6A1B9A),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "ID: ${data['id']}",
                    style: const TextStyle(
                        color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget label(String text) => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(text, style: const TextStyle(color: Colors.grey)),
      );

  static Widget value(String text) => Padding(
        padding: const EdgeInsets.only(top: 4),
        child:
            Text(text, style: const TextStyle(fontWeight: FontWeight.w500)),
      );
}
