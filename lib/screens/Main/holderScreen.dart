import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:String/controller/appStateController.dart';
import 'package:String/controller/authStateController.dart';
import 'package:heroicons/heroicons.dart';

class HolderScreen extends StatelessWidget {
  HolderScreen({super.key});

  final AppStateController _appStateController = Get.put(AppStateController());
  final AuthStateController _authStateController = Get.put(AuthStateController());

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print("Hey Before Call");
      _authStateController.getUserProfile();
      _authStateController.getAllUser();
      // _authStateController.logoutAuth();
      print("Hey After Call");
    },);

    return GetBuilder<AppStateController>(
      builder: (controller) {
        return Scaffold(
          body: controller.screens[controller.selectedIndex],

          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            child: Container(
              height: 60,
              width: Get.width,
              color: Colors.black,
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: (() {
                          controller.updateSelectedIndexItem(0);
                        }), 
                        child: (controller.selectedIndex == 0)?
                        (
                          const HeroIcon(
                            HeroIcons.home,
                            style: HeroIconStyle.solid,
                            color: Color(0xffFEDC00),
                            size: 28,
                          )
                        ):
                        (
                          const HeroIcon(
                            HeroIcons.home,
                            style: HeroIconStyle.outline,
                            color: Color(0xffFEDC00),
                              size: 28,
                          )
                        )
                      ),
                      TextButton(
                        onPressed: (() {
                          controller.updateSelectedIndexItem(1);
                        }), 
                        child: (controller.selectedIndex == 1)?
                        (
                          const HeroIcon(
                            HeroIcons.heart,
                            style: HeroIconStyle.solid,
                            color: Color(0xffFEDC00),
                            size: 28,
                          )
                        ):
                        (
                          const HeroIcon(
                            HeroIcons.heart,
                            style: HeroIconStyle.outline,
                            color: Color(0xffFEDC00),
                            size: 28,
                          )
                        )
                      ),
                      TextButton(
                        onPressed: (() {
                          controller.updateSelectedIndexItem(2);
                        }), 
                        child: (controller.selectedIndex == 2)?
                        (
                          const HeroIcon(
                            HeroIcons.chatBubbleBottomCenterText,
                            style: HeroIconStyle.solid,
                            color: Color(0xffFEDC00),
                            size: 28,
                          )
                        ):
                        (
                          const HeroIcon(
                            HeroIcons.chatBubbleBottomCenterText,
                            style: HeroIconStyle.outline,
                            color: Color(0xffFEDC00),
                            size: 28,
                          )
                        )
                      ),
                      TextButton(
                        onPressed: (() {
                          controller.updateSelectedIndexItem(3);
                        }), 
                        child: (controller.selectedIndex == 3)?
                        (
                          const HeroIcon(
                            HeroIcons.user,
                            style: HeroIconStyle.solid,
                            color: Color(0xffFEDC00),
                            size: 28,
                          )
                        ):
                        (
                          const HeroIcon(
                            HeroIcons.user,
                            style: HeroIconStyle.outline,
                            color: Color(0xffFEDC00),
                            size: 28,
                          )
                        )
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: -10,
                    left: -10,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xffFEDC00).withOpacity(0.1)
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}