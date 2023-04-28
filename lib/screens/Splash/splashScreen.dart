import 'package:String/storage/secureStorage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:String/controller/authStateController.dart';
import 'package:String/routes/app_route_names.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  final AuthStateController _authStateController = Get.put(AuthStateController());

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> checkForUser() async {
    String userId = await LocalStorage().fetchUserId();

    (userId == "") ? 
    (Get.toNamed(onboardingScreens)) :
    (Get.toNamed(holderScreen));
  }

  @override
  void initState() {
    super.initState();
    checkForUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            color: Colors.black,
              child: const Center(
                child: Text(
                  "String",
                  style: TextStyle(
                    color: Color(0xffFEDC00),
                    fontSize: 40,
                    fontFamily: "Stinger"
                  ),
                ),
              ),
          ),
          Positioned(
            right: -350,
            top: -200,
            child: Container(
              height: 500,
              width: 550,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(300),
                border: Border.all(
                  color: const Color(0xffFEDC00).withOpacity(0.2),
                )
              ),
            )
          ),
          Positioned(
            right: -50,
            left: -50,
            bottom: Get.height / 5,
            child: Container(
              height: 500,
              width: 550,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(300),
                border: Border.all(
                  color: const Color(0xffFEDC00).withOpacity(0.2),
                ),
              ),
            )
          ),
          Positioned(
            left: -400,
            bottom: -150,
            child: Container(
              height: 500,
              width: 550,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(300),
                border: Border.all(
                  color: const Color(0xffFEDC00).withOpacity(0.2),
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}