import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:String/controller/authStateController.dart';
import 'package:String/routes/app_route_names.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final AuthStateController _authStateController = Get.find<AuthStateController>();

  @override
  Widget build(BuildContext context) {

    return GetBuilder<AuthStateController>(
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                height: Get.height,
                width: Get.width,
                color: Colors.white,
              ),
              Positioned(
                left: -100,
                top: -100,
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    color: const Color(0xffFEDC00).withOpacity(0.1)
                  ),
                )
              ),
              Positioned(
                right: -150,
                bottom: Get.height / 3,
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    color: const Color(0xffFEDC00).withOpacity(0.1)
                  ),
                )
              ),
              Positioned(
                bottom: -100,
                left: -100,
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    color: const Color(0xffFEDC00).withOpacity(0.1)
                  ),
                )
              ),
              Positioned(
                child: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 60,
                                   backgroundImage: (controller.selectedImage1 != null)?
                                    FileImage(controller.selectedImage1!)
                                    : 
                                   (controller.user.images!.isEmpty) ?
                                  const AssetImage("images/profileAvatar.png") as ImageProvider
                                  : NetworkImage(controller.user.images![0])
                                ),
                                
                              ],
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Text(
                            controller.user.name!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: "Stinger"
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            (controller.location == "")?
                            (
                              "Enable Location"
                            ) 
                            :
                            (
                              controller.location
                            ),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontFamily: "Stinger"
                            ),
                          ),
                          const SizedBox(height: 20,),
                          ListTile(
                            onTap: () {
                              Get.toNamed(preferencesScreen);
                            },
                            leading: const Icon(
                              Icons.person_outline,
                              color: Colors.black,
                              size: 30,
                            ),
                            title: const Text(
                              "My Preferences",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: "Stinger"
                              ),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          ListTile(
                            onTap: () {
                              Get.toNamed(stringPremium);
                            },
                            leading: const Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                              size: 30,
                            ),
                            title: const Text(
                              "String premium",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: "Stinger"
                              ),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          ListTile(
                            onTap: () {
                              Get.toNamed(settingsScreen);
                            },
                            leading: const Icon(
                              Icons.settings_outlined,
                              color: Colors.black,
                              size: 30,
                            ),
                            title: const Text(
                              "App settings",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: "Stinger"
                              ),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          ListTile(
                            onTap: () {
                              controller.launchEmail();
                            },
                            leading: const Icon(
                              Icons.help_outline,
                              color: Colors.black,
                              size: 30,
                            ),
                            title: const Text(
                              "Need Help",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: "Stinger"
                              ),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),                   
                        ],
                      ),
                    ) ,
                  ),
                )
              ),
            ],
          ),
        );
      }
    );
  }
}