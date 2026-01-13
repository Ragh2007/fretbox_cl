import 'package:flutter/material.dart';
import './loading.dart';
import './auth.dart';
class Onboarding3 extends StatelessWidget {
  const Onboarding3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 40),

              // Illustration
              Image.asset(
                'assets/discover.png',
                height: 240,
                fit: BoxFit.contain,
              ),

              // Text section
              Column(
                children: const [
                  SizedBox(height: 24),
                  Text(
                    'Discover Your Hostel\non FretBox!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Find and connect with your hostel\n'
                    'through FretBox to access important\n'
                    'updates, services, and resources at your\n'
                    'fingertips.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      height: 1.4,
                    ),
                  ),
                ],
              ),

              // Buttons
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    // Primary button → NEXT PAGE
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Replace with actual next page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const AuthPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4C8BF5),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          'My Hostel is using FretBox',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Secondary button → CLICKABLE ONLY
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: OutlinedButton(
                        onPressed: () {
                          // Intentionally left empty (clickable only)
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Color(0xFF4C8BF5),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          'Refer Your Hostel',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF4C8BF5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// TEMP PAGE — replace later
class NextPagePlaceholder extends StatelessWidget {
  const NextPagePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Next Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
