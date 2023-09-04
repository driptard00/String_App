import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:String/controller/authStateController.dart';
import 'package:String/routes/app_route_names.dart';

class GenderScreen extends StatelessWidget {
  GenderScreen({super.key});

  final AuthStateController _authStateController = Get.put(AuthStateController());

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
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ),
                        Expanded(
                          flex: 15,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("images/smiley.png"),
                                  ],
                                ),
                                const SizedBox(height: 20,),
                                const Text(
                                  "What is your gender ?",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: "StingerBold"
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                InkWell(
                                  onTap: (() {
                                    controller.updateSelectedGender(0);
                                  }),
                                  child: Container(
                                    height: 50,
                                    width: Get.width,
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black
                                      ),
                                      color: (controller.selectedGender == 0)?
                                      (const Color(0xffFEDC00).withOpacity(0.2)):
                                      (Colors.white.withOpacity(0)),
                                      borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset("images/male.png"),
                                        const SizedBox(width: 10,),
                                        const Text(
                                          "Male",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: "Stinger"
                                            
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                InkWell(
                                  onTap: (() {
                                    controller.updateSelectedGender(1);
                                  }),
                                  child: Container(
                                    height: 50,
                                    width: Get.width,
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black
                                      ),
                                      color: (controller.selectedGender == 1)?
                                      (const Color(0xffFEDC00).withOpacity(0.2)):
                                      (Colors.white.withOpacity(0)),
                                      borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset("images/female.png"),
                                        const SizedBox(width: 10,),
                                        const Text(
                                          "Female",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: "Stinger"
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 50,),
                                const Text(
                                  "What do you want to date?",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: "StingerBold"
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                InkWell(
                                  onTap: (() {
                                    controller.updateSelectedDating(0);
                                  }),
                                  child: Container(
                                    height: 50,
                                    width: Get.width,
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black
                                      ),
                                      color: (controller.selectedDating == 0)?
                                      (const Color(0xffFEDC00).withOpacity(0.2)):
                                      (Colors.white.withOpacity(0)),
                                      borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset("images/male.png"),
                                        const SizedBox(width: 10,),
                                        const Text(
                                          "Man",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: "Stinger"
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                InkWell(
                                  onTap: (() {
                                    controller.updateSelectedDating(1);
                                  }),
                                  child: Container(
                                    height: 50,
                                    width: Get.width,
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black
                                      ),
                                      color: (controller.selectedDating == 1)?
                                      (const Color(0xffFEDC00).withOpacity(0.2)):
                                      (Colors.white.withOpacity(0)),
                                      borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset("images/female.png"),
                                        const SizedBox(width: 10,),
                                        const Text(
                                          "Woman",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                             fontFamily: "Stinger"
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                
                              ],
                            ),
                          )
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                              child: SizedBox(
                                height: 55,
                                width: Get.width,
                                child: TextButton(
                                  onPressed: (() {
                                    Get.toNamed(dateOfBirth);
                                  }),
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xffFEDC00),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)
                                    )
                                  ),
                                  child: const Text(
                                    "Continue",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: "Stinger"
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ),
                        
                      ],
                    ),
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