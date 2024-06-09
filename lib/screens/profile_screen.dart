import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasong_mobile_app/handlers/crud_handlers.dart';
import 'package:wasong_mobile_app/models/user.dart';
import 'package:wasong_mobile_app/screens/login_screen.dart';
import 'package:wasong_mobile_app/url.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool showAll = false;
  String imageUrl =
      "https://static.miraheze.org/bluearchivewiki/thumb/9/90/Natsu.png/399px-Natsu.png";

  late Future<Map<String, dynamic>> user;

  @override
  void initState() {
    super.initState();
    user = getUser();
  }

  Future<Map<String, dynamic>> getUser() async {
    final session = await CrudHandlers.getSession();
    if (session == null) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      });
      throw Exception('Session is null');
    }
    if (kDebugMode) {
      print(session);
    }
    final uri = Uri.parse("${URL.url}/api/users/uid=${session['uid']}");
    final response = await http.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final profileData = jsonDecode(response.body);
      return profileData;
    } else {
      throw Exception(
          'Failed to load profile: ${response.statusCode}:${jsonDecode(response.body)["error"].toString()}');
    }
  }

  bool isNullOrEmpty(dynamic value) {
    if (value == null) {
      return true;
    } else if (value is String) {
      return value.isEmpty;
    } else if (value is List) {
      return value.isEmpty;
    } else if (value is Map) {
      return value.isEmpty;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final userData = snapshot.data!;
            return SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 2),
                                  color: Color.fromARGB(90, 0, 0, 0),
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                )
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(8.0)),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 8.0)),
                      Expanded(
                        child: Container(
                            height: MediaQuery.of(context).size.width /
                                2, // Ensuring the container height matches the image size
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                    padding: EdgeInsets.only(top: 8.0)),
                                Text(
                                  isNullOrEmpty(userData["Name"])
                                      ? "Awowowogaga"
                                      : userData["Name"],
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 8.0)),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.black54),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 2),
                            color: Color.fromARGB(90, 0, 0, 0),
                            blurRadius: 4,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      constraints: const BoxConstraints(minHeight: 250),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "About",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            isNullOrEmpty(userData["About"])
                                ? "Awowwwww"
                                : userData["About"],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      )),
                  const Padding(padding: EdgeInsets.only(top: 24.0)),
                ],
              ),
            ));
          }
        });
  }
}
