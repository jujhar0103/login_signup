import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 233, 255),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 161),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const LoginPage(),
                  ),
                );
              },
              child: Text(
                'Login',
                style: GoogleFonts.itim().copyWith(
                  fontSize: 28,
                  color: const Color.fromARGB(255, 97, 37, 112),
                ),
              ),
            ),
            const SizedBox(height: 35),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 2,
                  width: 45,
                  color: const Color.fromARGB(255, 97, 37, 112),
                ),
                const SizedBox(width: 6.03),
                Text(
                  'OR',
                  style: GoogleFonts.itim().copyWith(
                    fontSize: 22,
                    color: const Color.fromARGB(255, 97, 37, 112),
                  ),
                ),
                const SizedBox(width: 6.03),
                Container(
                  height: 2,
                  width: 45,
                  color: const Color.fromARGB(255, 97, 37, 112),
                ),
              ],
            ),
            const SizedBox(height: 23),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 141, 199),
                padding: const EdgeInsets.symmetric(
                  horizontal: 109,
                  vertical: 13,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Sign up',
                style: GoogleFonts.itim().copyWith(
                  fontSize: 28,
                  color: const Color.fromARGB(255, 97, 37, 112),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
