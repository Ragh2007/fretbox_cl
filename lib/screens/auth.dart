import 'package:flutter/material.dart';
import './loading.dart';
class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // Title
            const Text(
              'Sign In As Resident',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 14),

            // Info box
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFE9F4FF),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFB6DAFF)),
              ),
              child: Row(
                children: const [
                  Icon(Icons.info_outline, color: Color(0xFF4C8BF5)),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'You can log in only using your registered mobile number or email.',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF4C8BF5),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Phone number label
            const Text(
              'Phone Number',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 8),

            // Phone field
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF4C8BF5)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Text(
                    'IND +91',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const Icon(Icons.arrow_drop_down),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 4),

            // Counter
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '0/10',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Divider text
            const Center(
              child: Text(
                'Or, sign in with',
                style: TextStyle(color: Colors.grey),
              ),
            ),

            const SizedBox(height: 14),

            // Social buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _socialButton('assets/mail.png', 'Email'),
                _socialButton('assets/mircosoft.png', 'Microsoft'),
                _socialButton('assets/google.png', 'Google'),
              ],
            ),

            const SizedBox(height: 50),

            // Continue button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const LoadingPage()),
  );
},

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 14),

            // Footer note
            const Center(
              child: Text(
                'After login here, it will make you logout from other devices',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _socialButton(String icon, String label) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Image.asset(icon, height: 18),
          const SizedBox(width: 6),
          Text(label),
        ],
      ),
    );
  }
}

// /// Dummy next page
// class NextPagePlaceholder extends StatelessWidget {
//   const NextPagePlaceholder({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text(
//           'Next Page',
//           style: TextStyle(fontSize: 22),
//         ),
//       ),
//     );
//   }
// }
