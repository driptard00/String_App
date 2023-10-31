import 'package:String/controller/authStateController.dart';
import 'package:String/controller/chatController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_route_names.dart';


final ChatController _chatController = Get.put(ChatController());

class UserChatList {
  static showUserChatList() {
    Get.bottomSheet(
      GetBuilder<AuthStateController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Container(
              height: 600,
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                    width: Get.width,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        hintText: "Search for users...",
                        hintStyle: const TextStyle(
                          fontFamily: "Stinger"
                        )
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      child: ListView.separated(
                        itemCount: controller.activeUserDating.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                        itemBuilder: (context, index) {
                          if (controller.activeUserDating.isEmpty) {
                            return const Text(
                              "No users found!!!!",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                            );
                          } else {
                            return InkWell(
                              onTap: () {
                                controller.createChat(controller.activeUserDating[controller.userItemIndex]["_id"]);
                              },
                              child: Container(
                                height: 70,
                                width: Get.width,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage: NetworkImage(controller.activeUserDating[index]["images"][0]),
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    Expanded(
                                      flex: 8,
                                      child: Text(
                                        controller.activeUserDating[index]["name"],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily: "Stinger"
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        }
                      )
                    ),
                  )
                ],
              ),
            ),
          );
        }
      ),
      isScrollControlled: true
    );
  }
}