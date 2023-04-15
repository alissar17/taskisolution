import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskisolution/Componant/FieldComponant.dart';
import 'package:taskisolution/Controllers/HomeController.dart';
import 'package:taskisolution/Models/User.dart';

class UserComponant extends StatelessWidget {
  User? user;
  UserComponant({this.user});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController(text: user!.firstName);
    TextEditingController lastNameController = TextEditingController(text: user!.lastName);
    TextEditingController emailController = TextEditingController(text: user!.email);
    TextEditingController phoneController = TextEditingController(text: user!.phoneNumber);
    HomeController controller = Get.put(HomeController());
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFF37E2D5)),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 15,
            offset: Offset(4, 8), // Shadow position
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xFF37E2D5),
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user!.firstName + " " + user!.lastName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, overflow: TextOverflow.clip),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  user!.email + " | " + user!.phoneNumber,
                  style: TextStyle(
                      color: Colors.black26, overflow: TextOverflow.clip),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () async=> await controller.deleteUser(user!.id , context),
            child: const CircleAvatar(
                backgroundColor: Color(0xFF37E2D5),
                child:
                Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 20,
                ),
              ),
          ),
        ],
      ),
    );
  }
}
