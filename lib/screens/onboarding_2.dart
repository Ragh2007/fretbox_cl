import 'package:flutter/material.dart';
import './onboarding_3.dart';
class Onboarding2 extends StatelessWidget {
  const Onboarding2({Key? key}) : super(key: key);

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
                'assets/connect.png',
                height: 240,
                fit: BoxFit.contain,
              ),

              // Text content
              Column(
                children: const [
                  SizedBox(height: 24),
                  Text(
                    'Stay\nConnected!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'View Notices, Check Kitchen Menu,\n'
                    'Access Important Contacts, Pay Rent &\n'
                    'Other Charges, Download Invoices',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      height: 1.4,
                    ),
                  ),
                ],
              ),

              // Next button
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
                              builder: (_) => const Onboarding3(),
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
