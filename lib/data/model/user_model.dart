import 'package:flutter/material.dart';

class UserModel {
  final int id;
  final String username;
  final String email;
  final String gender;
  final String token;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.gender,
    required this.token,
  });

  factory UserModel.fromJson(Map data) {
    return UserModel(
      id: data['id'],
      username: data['username'],
      email: data['email'],
      gender: data['gender'],
      token: data['token'],
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'username': username,
        'email': email,
        'gender': gender,
        'token': token,
      };
}
