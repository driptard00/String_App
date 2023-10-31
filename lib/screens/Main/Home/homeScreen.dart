import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:String/controller/authStateController.dart';
import 'package:String/routes/app_route_names.dart';
import 'package:badges/badges.dart' as badges;
import 'package:loading_overlay/loading_overlay.dart';

import '../../../controller/chatController.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final SwiperController _swiperController = SwiperController();
  final ChatController _chatController = Get.put(ChatController()) ;

  @override
  Widget build(BuildContext context) {

    return GetBuilder<AuthStateController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          body:  
            (controller.isLoading)?
            const Center(
              child: CircularProgressIndicator(
                color: Color(0xffFEDC00),
              ),
            )
            :
            LoadingOverlay(
              isLoading: controller.isCreateChatLoading,
              progressIndicator: const CircularProgressIndicator(
                color: Color(0xffFEDC00),
              ),
              color: Colors.black,
              child: Stack(
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
                          mainAxisSize: MainAxisSize.min,
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
                                          backgroundImage: (controller.user.images!.isEmpty)?
                                          const AssetImage("images/profileAvatar.png") as ImageProvider
                                          :NetworkImage(controller.user.images![0])
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
                                    Row(
                                      children: [
                                        Text(
                                          controller.user.hearts.toString(),
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.toNamed(stringPremium);
                                          },
                                          child: const HeroIcon(
                                            HeroIcons.heart,
                                            style: HeroIconStyle.solid,
                                            color: Color(0xffFEDC00),
                                            size: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 14,
                              child: Container(
                                child: (controller.isLoading)?
                                const Center(
                                  child: CircularProgressIndicator(
                                    color: Color(0xffFEDC00),
                                  ),
                                )
                                :
                                (controller.activeUserDating.isEmpty)?
                                const Center(
                                  child: Text(
                                    "No Users Available",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: "Stinger"
                                    ),
                                  ),
                                )
                                :
                                Swiper(
                                  itemCount: controller.activeUserDating.length,
                                  itemHeight: Get.height,
                                  itemWidth: Get.width,
                                  controller: _swiperController,
                                  layout: SwiperLayout.TINDER,
                                  loop: false,
                                  onIndexChanged: (index) {
                                    controller.updaterUserItemIndex(index);
                                    // print(index);
                                  },
                                  onTap: (index) {
                                    Get.toNamed(
                                      matchProfileScreen,
                                      arguments: {
                                        "user": controller.activeUserDating[index]
                                      }
                                    );
                                  },
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: Get.width,
                                      // padding: const EdgeInsets.all(20),
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
                                      child: Container(
                                        height: Get.height,
                                        width: Get.width,
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          gradient: LinearGradient(
                                            colors: [
                                              const Color(0xff000000).withOpacity(0.1),
                                              const Color(0xff000000).withOpacity(0.8),
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          )
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "${controller.activeUserDating[index]["name"].toString().split(" ").first}, ",
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Poppins",
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                Text(
                                                  controller.calculateAge(controller.activeUserDating[index]["dob"]).toString(),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Poppins",
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "${controller.activeUserDating[index]["Gender"]} | ${controller.activeUserDating[index]["occupation"]}",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Poppins",
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    );
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: (controller.activeUserDating.isEmpty)?
                              const SizedBox()
                              :
                              Container(
                                width: Get.width,
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        _swiperController.next();   
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
                                        controller.createChat(controller.activeUserDating[controller.userItemIndex]["_id"]);
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
              ),
            )
        );
      }
    );
  }
}