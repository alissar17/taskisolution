import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

                centerTitle: true,
              ),
              body: Container(
                alignment: Alignment.center,
                child: controller.loading
                    ? CircularProgressIndicator(
                        color: Color(0xFF37E2D5),
                      )
                    : controller.users!.isEmpty
                        ? Text(
                            "There is no Users",
                            style: TextStyle(
                                fontSize: 30, color: Color(0xFF37E2D5)),
                          )
                        : ListView.builder(
                            itemCount: controller.users!.length,
                            itemBuilder: (context, index) {
                              return UserComponant(
                                user: controller.users![index],
                              );
                            },
                          ),
              ),
            ));
  }
}
