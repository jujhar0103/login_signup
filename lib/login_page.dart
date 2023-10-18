import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? _idController;
  TextEditingController? _passwordController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 233, 255),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _idController,
              decoration: const InputDecoration(
                label: Text('User ID'),
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                label: Text('Password'),
              ),
              obscureText: true,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
