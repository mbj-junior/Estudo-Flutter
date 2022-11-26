import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  Future<void> _authenticate(
      String email, String password, String urlFragment) async {
    final _url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlFragment?key=AIzaSyB_27ejOHCiqcD15L1cMj23qHyb_rIC4qE';
    final response = await http.post(
      Uri.parse(_url),
      body: jsonEncode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    print(jsonDecode(response.body));
  }

  Future<void> signup(String email, String password) async {
    _authenticate(email, password, "signUp");
  }

  Future<void> signInWithPassword(String email, String password) async {
    _authenticate(email, password, "signInWithPassword");
  }
}
