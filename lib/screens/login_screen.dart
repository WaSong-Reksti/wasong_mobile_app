import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasong_mobile_app/navigations/main_navigations.dart';
import 'package:wasong_mobile_app/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:wasong_mobile_app/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = "";
  String _password = "";

  Future<void> _login() async {
    final url =
        Uri.parse('https://c719-114-122-106-87.ngrok-free.app/api/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': _email,
        'password': _password,
      }),
    );
    if (!mounted) return;
    if (response.statusCode == 200) {
      // Handle successful login
      final responseBody = jsonDecode(response.body);
      final token = responseBody['idToken'];

      // Save the token to shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);

      if (!mounted) return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return MainNavigation();
      }));
    } else {
      // Handle login failure
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  "Login",
                  style: GoogleFonts.rubik(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              TextField(
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
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
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
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: _login,
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0))),
                      ),
                      child: Text(
                        "Sign In",
                        style: GoogleFonts.rubik(fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style:
                        GoogleFonts.rubik(decoration: TextDecoration.underline),
                  )),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(text: '', children: [
                  TextSpan(
                    text: "Did not have an account? ",
                    style: GoogleFonts.rubik(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const RegisterScreen();
                        }));
                      },
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: Text(
                        "Register",
                        style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
