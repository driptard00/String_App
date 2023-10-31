import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:String/widgets/deleteUserBottom.dart';
import '../../../../controller/authStateController.dart';

class SettingScreen extends StatelessWidget {  
  SettingScreen({super.key});

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
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          const Row(
                            children:  [
                              SizedBox(width: 20,),
                              Icon(
                                Icons.settings_outlined,
                                color: Colors.black,
                                size: 30,
                              ),
                              SizedBox(width: 10,),
                              Text(
                                'App Setting',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: "Stinger"
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          settingsList("Contact Us", Icons.arrow_forward_ios_rounded, (){
                            controller.launchEmail();
                          }),
                          ListTile(
                            title: const Text(
                              "Location",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "Stinger"
                              ),
                            ),
                            trailing: CupertinoSwitch(
                              value: controller.locationOn,
                              activeColor: Colors.black,
                              thumbColor: const Color(0xffFEDC00),
                              onChanged: ((value) {
                                controller.toggleLocation(value);
                                if (controller.locationOn) {
                                  controller.getLocation();
                                }else{
                                  return null;
                                }
                              })
                            ),
                          ),
                          settingsList("Privacy Policy", Icons.arrow_forward_ios_rounded, (){
                            controller.launchPrivacy();
                          }),
                          settingsList("Delete Account", Icons.arrow_forward_ios_rounded, (){DeleteAccountBottom.showDeleteAccountBottom();}),
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            height: 55,
                            width: 140,
                            child: TextButton(
                              onPressed: (() {
                                controller.logoutAuth();
                              }),
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xffFEDC00),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                                ),
                              ),
                              child: (controller.isLoading)?
                              const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                              :
                              const Text(
                                "Logout",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: "Stinger"
                                ),
                              ),
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

  ListTile settingsList(String title, IconData icon, dynamic onTap) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontFamily: "Stinger"
        ),
      ),
      trailing: Icon(
        icon,
        size: 20,
        color: Colors.black,
      ),
    );
  }