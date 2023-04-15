import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taskisolution/Models/User.dart';

class UserManager {
  static String httpLink = "https://47ad-94-187-2-139.ngrok-free.app";
  static getAllUsers() async {
    try {
      final response = await http.get(Uri.parse('${httpLink}/users'));

      if (response.statusCode == 200) {
        List<dynamic> users = jsonDecode(response.body);

        List<User> userList = await users.map((userJson) {
          return User.fromJson(userJson);
        }).toList();
        return userList;
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {}
  }


  static deleteUser(id, BuildContext context) async {
    final response =
        await http.delete(Uri.parse('${httpLink}/deleteuser/${id}'));
    if (response.statusCode == 200) {
      final snackBar = SnackBar(
        content: const Text('Success Delete User'),
      showCloseIcon: true,
        duration: Duration(seconds: 1),
        backgroundColor: Color(0xFF37E2D5),

      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return true;
    } else {
      throw Exception('Failed to delete user');
    }
  }
}
