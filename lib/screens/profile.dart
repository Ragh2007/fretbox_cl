import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  String name = '';
  String phone = '';
  String roll = '';
  String room = '';
  String email = '';
  int profilePercent = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadUser();
  }

  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? 'User';
      phone = prefs.getString('phone') ?? '--';
      roll = prefs.getString('roll') ?? '--';
      room = prefs.getString('room') ?? '--';
      email = prefs.getString('email') ?? '--';
      profilePercent = prefs.getInt('profilePercent') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            _profileInfo(),
            _tabs(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _myProfileTab(),
                  _myRoomTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /* ---------------- HEADER ---------------- */

  Widget _header() {
    return Container(
      height: 180,
      width: double.infinity,
      color: const Color(0xFF45C2F0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              const CircleAvatar(
                radius: 42,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 48),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: InkWell(
                  onTap: () async {
                    final updated = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EditProfilePage(
                          name: name,
                          phone: phone,
                          roll: roll,
                          room: room,
                          email: email,
                          profilePercent: profilePercent,
                        ),
                      ),
                    );

                    if (updated == true) {
                      _loadUser(); // 🔁 sync after edit
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.edit, size: 18),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Edit Profile',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  /* ---------------- BASIC INFO ---------------- */

  Widget _profileInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          _InfoRow(icon: Icons.phone, text: phone),
          _InfoRow(icon: Icons.badge, text: 'Roll No: $roll'),
          _InfoRow(icon: Icons.home, text: room),
          _InfoRow(icon: Icons.email, text: email),
        ],
      ),
    );
  }

  /* ---------------- TABS ---------------- */

  Widget _tabs() {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: _tabController,
        labelColor: const Color(0xFF4C8BF5),
        unselectedLabelColor: Colors.grey,
        indicatorColor: const Color(0xFF4C8BF5),
        tabs: const [
          Tab(text: 'My Profile'),
          Tab(text: 'My Room'),
        ],
      ),
    );
  }

  /* ---------------- MY PROFILE TAB ---------------- */

  Widget _myProfileTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: _card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profile Completeness',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text('$profilePercent% Profile Completed'),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: profilePercent / 100,
                minHeight: 8,
                backgroundColor: Colors.grey.shade300,
                color: const Color(0xFF4C8BF5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /* ---------------- MY ROOM TAB ---------------- */

  Widget _myRoomTab() {
    return Center(
      child: Text(
        room,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }

  /* ---------------- HELPERS ---------------- */

  Widget _card({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: child,
    );
  }
}

/* ---------------- EDIT PROFILE PAGE ---------------- */

class EditProfilePage extends StatefulWidget {
  final String name, phone, roll, room, email;
  final int profilePercent;

  const EditProfilePage({
    super.key,
    required this.name,
    required this.phone,
    required this.roll,
    required this.room,
    required this.email,
    required this.profilePercent,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController nameCtrl;
  late TextEditingController phoneCtrl;
  late TextEditingController rollCtrl;
  late TextEditingController roomCtrl;
  late TextEditingController emailCtrl;
  late TextEditingController percentCtrl;

  @override
  void initState() {
    super.initState();
    nameCtrl = TextEditingController(text: widget.name);
    phoneCtrl = TextEditingController(text: widget.phone);
    rollCtrl = TextEditingController(text: widget.roll);
    roomCtrl = TextEditingController(text: widget.room);
    emailCtrl = TextEditingController(text: widget.email);
    percentCtrl =
        TextEditingController(text: widget.profilePercent.toString());
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameCtrl.text);
    await prefs.setString('phone', phoneCtrl.text);
    await prefs.setString('roll', rollCtrl.text);
    await prefs.setString('room', roomCtrl.text);
    await prefs.setString('email', emailCtrl.text);
    await prefs.setInt(
        'profilePercent', int.tryParse(percentCtrl.text) ?? 0);

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _field('Name', nameCtrl),
            _field('Phone', phoneCtrl),
            _field('Roll', rollCtrl),
            _field('Room', roomCtrl),
            _field('Email', emailCtrl),
            _field('Profile %', percentCtrl),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _save,
              child: const Text('Save Changes'),
            ),
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

/* ---------------- SMALL WIDGET ---------------- */

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.blue),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
