import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taskisolution/Models/User.dart';

class UserManager {
  static getAllUsers() async {
    final response = await http
        .get(Uri.parse('https://9218-94-187-0-80.ngrok-free.app/users'));
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load users');
    }
  }

  static addUser(UserModel user) async {
    final response = await http.post(
        Uri.parse('https://9218-94-187-0-80.ngrok-free.app/addusers'),
        body: jsonEncode(<String, String>{
          "first_name": "${user.firstName}",
          "last_name": "${user.lastName}",
          "email": "${user.email}",
          "phone_number": "${user.phoneNumber}"
        }));
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to load album');
    }
  }

  static deleteUser(id) async {
    final response = await http.delete(
        Uri.parse('https://9218-94-187-0-80.ngrok-free.app/deleteuser/${id}'));
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete user');
    }
  }
}
