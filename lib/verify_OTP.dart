import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:login_signup/constant_variables.dart';


class VerifyOTP extends StatefulWidget {
  const VerifyOTP({
    required this.username,
    required this.email,
    required this.password,
    required this.city,
    super.key,
  });

  final String username;
  final String email;
  final String password;
  final String city;

  @override
  State<VerifyOTP> createState() {
    return _VerifyOTPState();
  }
}

class _VerifyOTPState extends State<VerifyOTP> {
  final _formKey = GlobalKey<FormState>();
  var _enteredOTP = '';

  void verifyOTP() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final url = Uri.parse(
          '$address/verifyotp');

      final response = await http.post(
        url,
        headers: {'Content-type': 'application/json'},
        body: json.encode(
          {
            'username': widget.username,
            'email': widget.email,
            'password': widget.password,
            'city': widget.city,
            'otp': _enteredOTP,
          },
        ),
      );

      print(response.statusCode);
      print(json.decode(response.body));
    }
  }

  void resendOTP() async {
    final url = Uri.parse(
        '$address/resendotp');

    final response = await http.post(
      url,
      headers: {'Content-type': 'application/json'},
      body: json.encode(
        {
          'email': widget.email,
        },
      ),
    );

    print(response.statusCode);
    print(json.decode(response.body));
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
                    label: Text('Enter OTP'),
                  ),
                  validator: (value) {
                    return null;
                  },
                  onSaved: (value) {
                    _enteredOTP = value!;
                  }),
              TextButton(
                onPressed: verifyOTP,
                child: const Text('Verify OTP'),
              ),
              TextButton(
                onPressed: resendOTP,
                child: const Text("Resend OTP"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
