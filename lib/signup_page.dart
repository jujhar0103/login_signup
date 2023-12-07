import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:login_signup/constant_variables.dart';

import 'package:login_signup/verify_OTP.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() {
    return _SignupPageState();
  }
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  var _username = '';
  var _email = '';
  var _password = '';
  var _city = '';

  void register() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final url = Uri.parse(
          '$address/register');

      final response = await http.post(
        url,
        headers: {'Content-type': 'application/json'},
        body: json.encode(
          {
            'username': _username,
            'email': _email,
            'password': _password,
            'city': _city,
          },
        ),
      );

      print(response.statusCode);
      print(json.decode(response.body));

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => VerifyOTP(
            username: _username,
            email: _email,
            password: _password,
            city: _city,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 233, 255),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Username'),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ae kya tutul putul';
                  }
                  return null;
                },
                onSaved: (value) {
                  _username = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty ||
                      !EmailValidator.validate(value)) {
                    return 'Thike bhai.. maan liya';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Password'),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 3) {
                    return 'Account ki parwah nhi h kya.. 3 se jyada digits rakh';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('City'),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Tera papa yeh sheher mein rehta tha kya';
                  }
                  return null;
                },
                onSaved: (value) {
                  _city = value!;
                },
              ),
              TextButton(
                onPressed: register,
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
