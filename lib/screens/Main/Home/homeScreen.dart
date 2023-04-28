import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:String/controller/authStateController.dart';
import 'package:String/routes/app_route_names.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final AuthStateController _authStateController = Get.find<AuthStateController>();

  @override
  Widget build(BuildContext context) {

    return GetBuilder<AuthStateController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: (controller.isLoading) ? 
          (
            const Center(
              child: CircularProgressIndicator(
                color: Color(0xffFEDC00)
              ),
            )
          ) : 
          (
            Stack(
              children: [
                Container(
                  height: Get.height,
                  width: Get.width,
                  color: Colors.black,
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
                  child: SafeArea(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundImage: (controller.user.images != null || controller.user.images!.isEmpty)
                                        ? NetworkImage(controller.user.images![0])
                                        : const AssetImage("images/profileAvatar.jpg") as ImageProvider
                                      ),
                                      const SizedBox(width: 10,),
                                      Text(
                                        "Hi, ${controller.user.name!.split(" ").first}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: "Stinger"
                                        ),
                                      )
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // Get.toNamed();
                                    },
                                    child: const HeroIcon(
                                      HeroIcons.heart,
                                      style: HeroIconStyle.solid,
                                      color: Color(0xffFEDC00),
                                      size: 30,
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 14,
                            child: Container(
                              child: Swiper(
                                onTap: (index) {
                                  Get.toNamed(
                                    matchProfileScreen,
                                    arguments: {
                                      "user": controller.activeUserDating[index]
                                    }
                                  );
                                },
                                itemCount: (controller.activeUserDating.isEmpty) ? 1 : controller.activeUserDating.length,
                                itemBuilder: (context, index) {
                                  if(controller.activeUserDating.isEmpty){
                                    return const Center(
                                      child: Text(
                                        'No user found',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Stinger",
                                          fontSize: 25,
                                        ),
                                      ),
                                    );
                                  }else{
                                    return Container(
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        border: Border.all(
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(
                                          image: NetworkImage(controller.activeUserDating[index]["images"][0]),
                                          fit: BoxFit.cover
                                        )
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${controller.activeUserDating[index]["name"]},",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Stinger",
                                              fontSize: 25,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }
                                },
                                itemHeight: Get.height,
                                itemWidth: Get.width,
                                layout: SwiperLayout.TINDER,
                                onIndexChanged: (int index) {
                                  controller.updaterUserItemIndex(index);
                                },
                                controller: controller.swiperController,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              width: Get.width,
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.removeUser(controller.activeUserDating[controller.userItemIndex]);
                                    },
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white
                                        ),
                                        borderRadius: BorderRadius.circular(30)
                                      ),                
                                      child: const HeroIcon(
                                        HeroIcons.xMark,
                                        style: HeroIconStyle.solid,
                                        color: Color(0xffFEDC00),
                                        size: 40,
                                      )
                                    ),
                                  ),
                                  const SizedBox(width: 20,),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(
                                        chatRoom,
                                        arguments: {
                                          "user": controller.activeUserDating[controller.userItemIndex]
                                        }
                                      );
                                    },
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white
                                        ),
                                        borderRadius: BorderRadius.circular(40)
                                      ),
                                      child: const HeroIcon(
                                        HeroIcons.chatBubbleBottomCenterText,
                                        style: HeroIconStyle.outline,
                                        color: Color(0xffFEDC00),
                                        size: 50,
                                      )
                                    ),
                                  ),
                                  const SizedBox(width: 20,),
                                  InkWell(
                                    onTap: () {
                                      controller.removeUser(controller.userItemIndex);
                                      controller.likeUser(controller.activeUserDating[controller.userItemIndex]["_id"]);
                                    },
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white
                                        ),
                                        borderRadius: BorderRadius.circular(30)
                                      ),
                                      child: const HeroIcon(
                                        HeroIcons.heart,
                                        style: HeroIconStyle.solid,
                                        color: Color(0xffFEDC00),
                                        size: 40,
                                      )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ),
              ],
            )
          )
        );
      }
    );
  }
}