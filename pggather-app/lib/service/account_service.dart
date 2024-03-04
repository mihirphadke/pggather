import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pggather_app/model/token.dart';

import '../environment.dart';

class AccountService {
  final String baseUrl = "${Environment.apiUrl}/pggather/";
  AccountService();

  Future<http.Response> validateToken(String token) async {
    try {
      final response = await http.get(Uri.parse(baseUrl), headers: {
        'Authorization': 'Bearer ' + token, // Set the content type
      });
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<http.Response> signup (String last_name, String first_name, String email, int birth_at, String password) async{
try {
      Map<String, dynamic> requestBody = {
        'last_name': last_name,
        'first_name':first_name,
        'user_password': password,
        'email': email,
        'birth_at': birth_at,
      };
      String requestBodyJson = jsonEncode(requestBody);

      // final response = await http.get(Uri.parse(baseUrl));
      final response = await http.post(
        Uri.parse("$baseUrl/users/"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: requestBodyJson,
      );
      if (response.statusCode == 200) {
        print("response 200");
        return response;
      } else {
        print(response.statusCode);
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<http.Response> login(String email, String password) async {
    try {
      Map<String, dynamic> requestBody = {
        'user_password': password,
        'email': email,
      };
      String requestBodyJson = jsonEncode(requestBody);

      // final response = await http.get(Uri.parse(baseUrl));
      final response = await http.post(
        Uri.parse("$baseUrl/login/"),
        headers: {
          'Content-Type': 'application/json', 
        },
        body: requestBodyJson,
      );
      if (response.statusCode == 200) {
        print("response 200");
        return response;
      } else {
        print(response.statusCode);
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
