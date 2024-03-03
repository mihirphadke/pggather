import 'package:http/http.dart';
import 'package:flutter/material.dart';

class User {
  final int user_id;
  final String last_name; 
  final String first_name;
  final String email;

  User(
      {required this.user_id,
      required this.last_name,
      required this.first_name,
      required this.email,});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      user_id: json['user_id'],
      last_name: json['last_name'],
      first_name: json['first_name'],
      email: json['email'],
    );
  }

}
