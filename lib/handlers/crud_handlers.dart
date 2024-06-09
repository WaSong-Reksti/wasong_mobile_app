// handlers/crud_handlers.dart

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasong_mobile_app/url.dart';
import 'package:http/http.dart' as http;

class CrudHandlers {
  static Future<dynamic> getClasses() async {
    final uri = Uri.parse("${URL.url}/api/courses");
    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final classesData = jsonDecode(response.body);
      return classesData;
    } else {
      throw Exception(
          'Failed to load classes: ${response.statusCode}:${jsonDecode(response.body)["error"].toString()}');
    }
  }

  static Future<dynamic> getSession() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      // Handle the case when there is no token
      throw Exception('No token found. User is not logged in.');
    }

    if (kDebugMode) {
      print("Token: $token");
    }

    final url = Uri.parse("${URL.url}/api/session");
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      // Handle successful session retrieval
      final sessionData = jsonDecode(response.body);
      return sessionData; // Do something with the session data
    } else {
      // Handle session retrieval failure
      final errorData = jsonDecode(response.body);
      if (errorData["error"].toString().contains("ID token has expired") ||
          (errorData["error"]
              .toString()
              .contains("ID token has been revoked"))) {
        throw Exception("Token revoked or expired");
      }
      throw Exception(
          'Failed to retrieve session: ${errorData["error"].toString()}');
    }
  }
}
