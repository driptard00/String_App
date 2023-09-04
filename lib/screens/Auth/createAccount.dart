import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:String/controller/authStateController.dart';
import 'package:String/routes/app_route_names.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

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
                left: -20,
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
                right: 40,
                bottom: 200,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
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
                        flex: 1,
                        child: Container(
                          child: const Center(
                            child: Text(
                              "Create an account",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontFamily: "StingerBold"
                              ),
                            ),
                          ),
                        )
                      ),
                      Expanded(
                        flex: 1,
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
                                    Get.toNamed(signupScreen);
                                  }),
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xffFEDC00),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)
                                    )
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.mail,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                      SizedBox(width: 10,),
                                      Text(
                                        "Create an account",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: "Stinger"
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20,),
                              // SizedBox(
                              //   height: 55,
                              //   width: Get.width,
                              //   child: TextButton(
                              //     onPressed: (() {
                              //       // Get.toNamed(authIntroScreen);
                              //     }),
                              //     style: TextButton.styleFrom(
                              //       backgroundColor: Colors.white.withOpacity(0),
                              //       shape: RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.circular(30)
                              //       ),
                              //       side: const BorderSide(
                              //         color: Colors.black
                              //       )
                              //     ),
                              //     child: Row(
                              //       mainAxisAlignment: MainAxisAlignment.center,
                              //       children: [
                              //         Image.asset(
                              //           "images/facebook.png",
                              //         ),
                              //         const SizedBox(width: 10,),
                              //         const Text(
                              //           "Continue with Facebook",
                              //           textAlign: TextAlign.center,
                              //           style: TextStyle(
                              //             color: Colors.black,
                              //             fontSize: 15,
                              //             fontFamily: "Stinger"
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // const SizedBox(height: 20,),
                              // SizedBox(
                              //   height: 55,
                              //   width: Get.width,
                              //   child: TextButton(
                              //     onPressed: (() {
                              //       // controller.signUpWithGoogle();
                              //     }),
                              //     style: TextButton.styleFrom(
                              //       backgroundColor: Colors.white.withOpacity(0),
                              //       shape: RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.circular(30)
                              //       ),
                              //       side: const BorderSide(
                              //         color: Colors.black
                              //       )
                              //     ),
                              //     child: Row(
                              //       mainAxisAlignment: MainAxisAlignment.center,
                              //       children: [
                              //         Image.asset(
                              //           "images/google.png",
                              //           height: 20,
                              //           width: 20,
                              //         ),
                              //         const SizedBox(width: 10,),
                              //         const Text(
                              //           "Continue with Google",
                              //           textAlign: TextAlign.center,
                              //           style: TextStyle(
                              //             color: Colors.black,
                              //             fontSize: 15,
                              //             fontFamily: "Stinger"
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
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
    );
  }
}