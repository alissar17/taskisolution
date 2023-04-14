import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskisolution/Componant/FieldComponant.dart';
import 'package:taskisolution/Componant/UserComponant.dart';
import 'package:taskisolution/Controllers/HomeController.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xFF37E2D5),
                title: const Text(
                  "Users",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return SingleChildScrollView(
                            child: Container(
                              margin: EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Add New User",
                                        style: TextStyle(
                                            color: Color(0xFF37E2D5),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          icon: Icon(
                                            Icons.close,
                                            color: Color(0xFF37E2D5),
                                          )),
                                    ],
                                  ),
                                  Field(
                                    label: "First Name",
                                    controller: controller.nameController,
                                  ),
                                  Field(
                                    label: "Last Name",
                                    controller: controller.lastNameController,
                                  ),
                                  Field(
                                    label: "email",
                                    controller: controller.emailController,
                                  ),
                                  Field(
                                      label: "Phone",
                                      controller: controller.phoneController,
                                      textInputType: TextInputType.number),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(
                                            0xFF37E2D5), // Background color
                                      ),
                                      onPressed: () async {
                                        await controller.addUsers();
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                          alignment: Alignment.center,
                                          width: 100,
                                          height: 50,
                                          child: Text("add")))
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.add,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Add new User"),
                      ],
                    ),
                  )
                ],
                centerTitle: true,
              ),
              body: Container(
                child: ListView.builder(
                  itemCount: controller.users.length,
                  itemBuilder: (context, index) {
                    return UserComponant(
                      user: controller.users[index],
                    );
                  },
                ),
              ),
            ));
  }
}
