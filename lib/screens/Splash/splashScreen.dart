import 'package:String/storage/secureStorage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:String/controller/authStateController.dart';
import 'package:String/routes/app_route_names.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

  final AuthStateController _authStateController = Get.put(AuthStateController());

  checkUser() async{
    String userId = await LocalStorage().fetchUserId();
    String userType = await LocalStorage().fetchUSERTYPE();

    if(userId == ""){
      Get.offAllNamed(onboardingScreens);
    } else {
      (userType == 'female')?
      Get.offAllNamed(femaleHoldersScreen)
      :
      (userType == 'male')?
      Get.offAllNamed(holderScreen)
      :
      null;
    }
  }

  Future<void> getFcmToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    String? token = await messaging.getToken();
    print('FCM Token: $token');

    await LocalStorage().storeDeviceId(token!);
  }

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    getFcmToken();
    _authStateController.updateFcmToken();
    Future.delayed(
      const Duration(seconds: 4),
      (){
      checkUser();
      }
    );
    super.initState();
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