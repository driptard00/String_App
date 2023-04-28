import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:String/routes/app_route_names.dart';

class AuthIntroScreen extends StatelessWidget {
  const AuthIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            right: 320,
            bottom: 730,
            child: Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: const Color(0xffFEDC00)
              ),
            )
          ),
          Positioned(
            right: 100,
            bottom: 700,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffFEDC00)
              ),
            )
          ),
          Positioned(
            right: 300,
            bottom: 400,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffFEDC00)
              ),
            )
          ),
          Positioned(
            right: 100,
            bottom: 300,
            child: Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: const Color(0xffFEDC00)
              ),
            )
          ),
          Positioned(
            child: Container(
              height: Get.height,
              width: Get.width,
              child: Column(
                children: [
                  Expanded(
                    flex: 13,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "String",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: "Stinger"
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text(
                            "Meet thousand of people\nby creating an account",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontFamily: "Stinger"
                            ),
                          ),
                        ],
                      ),
                    )
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 55,
                            width: Get.width,
                            child: TextButton(
                              onPressed: (() {
                                Get.toNamed(createAccount);
                              }),
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xffFEDC00),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                                )
                              ),
                              child: const Text(
                                "Create an account",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "Stinger"
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          SizedBox(
                            height: 55,
                            width: Get.width,
                            child: TextButton(
                              onPressed: (() {
                                Get.toNamed(signinScreen);
                              }),
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                                )
                              ),
                              child: const Text(
                                "Sign in",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "Stinger"
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}