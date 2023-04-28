import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:String/controller/authStateController.dart';
import 'package:String/routes/app_route_names.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

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
                color: Colors.black,
              ),
              Positioned(
                right: -250,
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
                left: -150,
                bottom: -50,
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
                right: -20,
                bottom: Get.height / 2.5,
                child: Transform.rotate(
                  angle: 13,
                  child: Container(
                    height: 310,
                    width: 210,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    image: const DecorationImage(
                      image: AssetImage("images/female1.png"),
                      fit: BoxFit.cover
                    )
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: Get.height / 2.5,
                child: Transform.rotate(
                  angle: 50,
                  child: Container(
                    height: 350,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    image: const DecorationImage(
                      image: AssetImage("images/male2.png"),
                      fit: BoxFit.cover
                    )
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 300,
                  width: Get.width,
                  decoration: const BoxDecoration(
                    // color: Colors.red
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Find amazing people around you",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xffFEDC00),
                          fontSize: 30,
                          fontFamily: "Stinger"
                        ),
                      ),
                      DotsIndicator(
                        dotsCount: controller.onboardingScreens.length,
                        position: controller.selectedIndex.toDouble(),
                        decorator: DotsDecorator(
                          activeColor: const Color(0xffFEDC00),
                          size: const Size.square(9.0),
                          activeSize: const Size(18.0, 9.0),
                          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 55,
                            width: 135,
                            child: TextButton(
                              onPressed: (() {
                                Get.toNamed(authIntroScreen);
                              }),
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                                )
                              ),
                              child: const Text(
                                "Skip",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: "Stinger"
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20,),
                          SizedBox(
                            height: 55,
                            width: 135,
                            child: TextButton(
                              onPressed: (() {
                                controller.updateSelectedIndex(1);
                              }),
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xffFEDC00),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                                )
                              ),
                              child: const Text(
                                "Next",
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
                      )
                    ],
                  ),
                ),
              ),
            ],
        
          ),
        );
      }
    );
  }
}