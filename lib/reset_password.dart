import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ResetPassword extends StatefulWidget {
  const ResetPassword({required this.email, super.key});

  final String email;

  @override
  State<ResetPassword> createState() {
    return _ResetPasswordState();
  }
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  var _enteredOTP = '';
  var _newPassword = '';

  void resetPass() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final url = Uri.parse(
          'https://fc82-2409-40d1-101c-3115-752a-747-d4e6-60e6.ngrok.io/api/v1/auth/resetpassword');

      final response = await http.post(
        url,
        headers: {'Content-type': 'application/json'},
        body: json.encode({
          'email': widget.email,
          'otp': _enteredOTP,
          'password': _newPassword,
        }),
      );

      print(response.statusCode);
      print(json.decode(response.body));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Enter the OTP sent to your email'),
                  ),
                  validator: (value) {
                    if (value == null || value.length != 4) {
                      return 'Enter a valid OTP';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _enteredOTP = value!;
                  }),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Enter the new password'),
                ),
                validator: (value) {
                  if (value == null || value.length < 3) {
                    return 'Password must have more than 3 digits';
                  }
                  return null;
                },
                onSaved: (value) {
                  _newPassword = value!;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
