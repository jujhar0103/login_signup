import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:login_signup/constant_variables.dart';
import 'package:login_signup/reset_password.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() {
    return _ForgotPasswordState();
  }
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void forgotPassword() async {
    final url = Uri.parse(
        '$address/forgetpassword');

    final response = await http.post(
      url,
      headers: {'Content-type': 'application/json'},
      body: json.encode(
        {
          'email': _emailController.text,
        },
      ),
    );

    print(response.statusCode);
    print(json.decode(response.body));

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ResetPassword(email: _emailController.text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                label: Text('Enter your email'),
              ),
            ),
            TextButton(
              onPressed: forgotPassword,
              child: const Text("Send OTP"),
            )
          ],
        ),
      ),
    );
  }
}
