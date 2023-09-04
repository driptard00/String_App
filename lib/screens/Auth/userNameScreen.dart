import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:String/routes/app_route_names.dart';

class UserNameScreen extends StatelessWidget {
  const UserNameScreen({super.key});

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
                        child: Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.person_outlined,
                                    color: Colors.black,
                                    size: 70,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Enter your username",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontFamily: "StingerBold"
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30,),
                              TextFormField(
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Colors.black
                                    )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Colors.black
                                    )
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.face_retouching_natural,
                                    color: Colors.black,
                                  ),
                                  labelText: "Username",
                                  floatingLabelBehavior: FloatingLabelBehavior.never
                                ),
                              ),
                            ],
                          ),
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
                                Get.toNamed(genderScreen);
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
}