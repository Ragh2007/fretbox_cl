import 'package:flutter/material.dart';
import './onboarding_2.dart';
class SaveTimePage extends StatelessWidget {
  const SaveTimePage({Key? key}) : super(key: key);

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

              // Image
              Image.asset(
                'assets/savetime.png',
                height: 220,
                fit: BoxFit.contain,
              ),

              // Text section
              Column(
                children: const [
                  SizedBox(height: 24),
                  Text(
                    'Save Your\nFollow Up Time',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Submit Complaints & Emergency\n'
                    'Requests, Share Suggestions &\n'
                    'Feedback, Apply for Leave',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      height: 1.4,
                    ),
                  ),
                ],
              ),

              // Button
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                   onPressed: () {
                          // TODO: Replace with actual next page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const Onboarding2(),
                            ),
                          );
                        },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4C8BF5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
