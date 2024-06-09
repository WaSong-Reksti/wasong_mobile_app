import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:wasong_mobile_app/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  String _confirmPassword = "";
  String _name = "";

  bool _validateEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  bool _validatePassword(String password) {
    return password.length >= 8;
  }

  Future<dynamic>? _register() async {
    final url =
        Uri.parse('https://c719-114-122-106-87.ngrok-free.app/api/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': _email,
        'password': _password,
        'name': _name,
      }),
    );
    if (!mounted) return;
    if (response.statusCode == 200) {
      // Handle successful login
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      //   return const LoginScreen();
      // }));
      Navigator.pop(context);
    } else {
      // Handle login failure
      final error = jsonDecode(response.body)['error'] ?? 'Registration failed';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error)),
      );
    }

    return null;
  }

  void _submitForm() {
    final invalidFields = _formKey.currentState?.validateGranularly();
    if (invalidFields?.isEmpty ?? true) {
      // Proceed with registration if no invalid fields
      _register();
    } else {
      // Find the first invalid field and show its error message in a SnackBar
      for (var field in invalidFields!) {
        final errorMessage = field.errorText;
        if (errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMessage)),
          );
          break;
        }
      }
    }
    if (kDebugMode) {
      print(_formKey.currentState?.validate() ?? false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "Register",
                  style: GoogleFonts.rubik(
                      fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Write your email here...',
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!_validateEmail(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Write your name here...',
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Write your password here...',
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (!_validatePassword(value)) {
                    return 'Password must be at least 8 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Write your password here...',
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _confirmPassword = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  } else if (value != _password) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0))),
                      ),
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.rubik(fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
