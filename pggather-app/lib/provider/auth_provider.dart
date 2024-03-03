import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:pggather_app/model/user.dart';
import 'package:pggather_app/service/account_service.dart';

class AuthProvider with ChangeNotifier {
  final AccountService _accountService;

  String? _token = null;
  User? _self = null;
  late String email;
  static final FlutterSecureStorage _storage = FlutterSecureStorage();
  AuthProvider(this._accountService);

  User? get self {
    return _self;
  }

  String? get token {
    return _token;
  }

  Future<void> signUp(String last_name, String first_name, String email,
      int birth_at) async {
    // Check if userId is unique
    // API call for sign up
  }

  Future<String> login(String username, String password) async {
    // API call for login
    print("logging in...");
    Response res = await _accountService.login(username, password);
    if (res.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(res.body);
      _token = data["token"];
      await _storage.write(key: "token", value: _token);
      return data["token"];
    }
    return "";
  }

  Future<void> logout() async {
    await _storage.delete(key: "token");
    _token = null;
  }

  Future<bool> isLoggedIn() async {
    String? token = _token;
    if (token == null) {
      token = await _storage.read(key: "token");
      _token = token;
    }
    if (token == null) {
      return false;
    }
    //at this point there is a token but it's not yet validated by the api
    Response res = await _accountService.validateToken(token);
    if (res.statusCode == 200) {
      Map<String, dynamic> data = json.decode(res.body);
      _self = User.fromJson(data);
      return true;
    }
    await _storage.delete(key: "token");
    _token = null;
    return false;
  }
}
