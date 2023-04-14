import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taskisolution/Manager/UserManager.dart';
import 'package:taskisolution/Models/User.dart';

class HomeController extends GetxController {
  List<UserModel> users = [
    UserModel(
        id: 1,
        email: "email",
        firstName: "firstName",
        lastName: "lastName",
        phoneNumber: "111111"),
    UserModel(
        id: 2,
        email: "email",
        firstName: "firstName",
        lastName: "lastName",
        phoneNumber: "111111"),
    UserModel(
        id: 3,
        email: "email",
        firstName: "firstName",
        lastName: "lastName",
        phoneNumber: "111111"),
    UserModel(
        id: 4,
        email: "email",
        firstName: "firstName",
        lastName: "lastName",
        phoneNumber: "111111"),
  ];
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  void onInit() async {
    super.onInit();
    await await UserManager.getAllUsers();
  }

  Future getUsers() async {
    users = await UserManager.getAllUsers();
  }

  Future addUsers() async {
    UserModel user = UserModel(
        id: 1,
        email: emailController.text,
        firstName: nameController.text,
        lastName: lastNameController.text,
        phoneNumber: phoneController.text);
    users.add(user);
    await UserManager.addUser(user);
    update();
  }

  Future deleteUser(id) async{
    users.removeWhere((i) => i.id == id);
    await UserManager.deleteUser(id);
    update();
  }
}
