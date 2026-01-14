import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
      height: 170,
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
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, size: 18),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Share FretBox',
            style: TextStyle(color: Colors.white),
          )
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
        children: const [
          Text(
            'Aditya Baran Sahoo',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10),
          _InfoRow(icon: Icons.phone, text: '7325802666'),
          _InfoRow(icon: Icons.badge, text: 'Fretbox ID : 8709'),
          _InfoRow(
            icon: Icons.home,
            text: 'RESIDENT of 2B-072 (KP-25B)',
          ),
          _InfoRow(icon: Icons.school, text: 'KIIT University'),
          _InfoRow(icon: Icons.email, text: '2305509@kiit.ac.in'),
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
      child: Column(
        children: [
          _card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Profile Completeness',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                const Text('26% Profile Completed'),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: 0.26,
                    minHeight: 8,
                    backgroundColor: Colors.grey.shade300,
                    color: const Color(0xFF4C8BF5),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Remaining: 14',
                        style: TextStyle(color: Colors.blue)),
                    Text('Updated: 6',
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
                const Divider(height: 24),
                _docRow('Voter Card'),
                _docRow('Driving Licence'),
                _docRow('Antiragging Affidavit by Student'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Academic Details',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4C8BF5),
                  ),
                ),
                SizedBox(height: 10),
                _detailRow('Course List', 'BTECH'),
                _detailRow('Branch', 'CSE'),
                _detailRow('Year', '3'),
                _detailRow('Roll no', '2305509'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _arrowCard('Family/Personal Details'),
          const SizedBox(height: 12),
          _arrowCard('KYC / Documents'),
        ],
      ),
    );
  }

  /* ---------------- MY ROOM TAB ---------------- */

  Widget _myRoomTab() {
    return const Center(
      child: Text(
        'My Room Details',
        style: TextStyle(color: Colors.grey),
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

  Widget _arrowCard(String text) {
    return _card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: const TextStyle(fontWeight: FontWeight.w500)),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }

  static Widget _docRow(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          const Icon(Icons.upload, color: Colors.grey),
        ],
      ),
    );
  }
}

/* ---------------- SMALL WIDGETS ---------------- */

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

class _detailRow extends StatelessWidget {
  final String label;
  final String value;

  const _detailRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text('$label :')),
          Text(value),
        ],
      ),
    );
  }
}