import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taskisolution/Manager/UserManager.dart';
import 'package:taskisolution/Models/User.dart';

class HomeController extends GetxController {
  List<User>? users ;

  bool loading = false;

  @override
  void onInit() async {
    super.onInit();
    await await getUsers();
  }

  Future getUsers() async {
    loading= true;
    update();
    users = await UserManager.getAllUsers();
    loading = false;
    update();
  }



  Future deleteUser(id, BuildContext context) async{

    await UserManager.deleteUser(id , context);
    users!.removeWhere((i) => i.id == id);
     update();
  }
}
