import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:String/controller/authStateController.dart';
import 'package:heroicons/heroicons.dart';
import 'package:loading_overlay/loading_overlay.dart';

class MatchProfileScreen extends StatelessWidget {
  MatchProfileScreen({super.key});

  var userDetails = Get.arguments["user"];

  final AuthStateController _authStateController = Get.find<AuthStateController>();

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _authStateController.getProfile(userDetails["_id"]);
    });

    return GetBuilder<AuthStateController>(
      builder: (controller) {
        return LoadingOverlay(
          isLoading: controller.isCreateChatLoading,
          progressIndicator: const CircularProgressIndicator(
            color: Color(0xffFEDC00),
          ),
          color: Colors.black,
          child: Scaffold(
            body: Stack(
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
                  child: Container(
                    child: (controller.isLoading)?
                    const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xffFEDC00),
                      ),
                    )
                    :
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 500,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(
                                color: Colors.white
                              ),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                              image: DecorationImage(
                                image: (userDetails["images"] == [])?
                                AssetImage(
                                  "images/avatar.jpg"
                                ) as ImageProvider
                                :
                                NetworkImage(userDetails["images"][0]),
                                fit: BoxFit.cover
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${controller.otherUser["name"]}, ${controller.calculateAge(controller.otherUser["dob"])}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              // fontFamily: "Stinger"
                                            ),
                                          ),
                                          Text(
                                            "${controller.otherUser["occupation"]}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize:15,
                                              fontFamily: "Stinger"
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: InkWell(
                                          onTap: () {
                                            controller.createChat(controller.activeUserDating[controller.userItemIndex]["_id"]);
                                          },
                                          child: const HeroIcon(
                                            HeroIcons.chatBubbleBottomCenterText,
                                            style: HeroIconStyle.outline,
                                            color: Color(0xffFEDC00),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 5,),
                                const Row(
                                  children:  [
                                    // Text(
                                    //   "${userDetails["distance"]} | ",
                                    //   style: GoogleFonts.poppins(
                                    //     color: Colors.white,
                                    //     fontSize: 15,
                                    //   ),
                                    // ),
                                    // Text(
                                    //   "${userDetails["state"]}",
                                    //   style: GoogleFonts.poppins(
                                    //     color: Colors.white,
                                    //     fontSize: 15,
                                    //   ),
                                    // ),
                                  ],
                                ),
                                const SizedBox(height: 15,),
                                const  Text(
                                  "Bio",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: "Stinger"
                                  ),
                                ),
                                Text(
                                  "${controller.otherUser["bio"]}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 15,),
                                const  Text(
                                  "Other Photos",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: "Stinger"
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: CircleAvatar(
                                        radius: 35,
                                      backgroundImage: (userDetails["images"].length >= 2)
                                      ? NetworkImage(userDetails["images"]![1])
                                      : const AssetImage("images/profileAvatar.png") as ImageProvider
                                      ),
                                    ),      
                                    SizedBox(width: 20,),
                                    Expanded(
                                      child: CircleAvatar(
                                        radius: 35,
                                      backgroundImage: (userDetails["images"].length >= 3)
                                      ? NetworkImage(userDetails["images"]![2])
                                      : const AssetImage("images/profileAvatar.png") as ImageProvider
                                      ),
                                    ),     
                                    SizedBox(width: 20,),
                                    Expanded(
                                      child: CircleAvatar(
                                        radius: 35,
                                      backgroundImage: (userDetails["images"].length >= 4)
                                      ? NetworkImage(userDetails["images"]![3])
                                      : const AssetImage("images/profileAvatar.png") as ImageProvider
                                      ),
                                    ),
                                    SizedBox(width: 20,),
                                    Expanded(
                                      child: CircleAvatar(
                                        radius: 35,
                                      backgroundImage: (userDetails["images"].length >= 5)
                                      ? NetworkImage(userDetails["images"]![4])
                                      : const AssetImage("images/profileAvatar.png") as ImageProvider
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:  [
                                    CircleAvatar(
                                      radius: 35,
                                      backgroundImage: (userDetails["images"].length >= 6)
                                      ? NetworkImage(userDetails["images"]![5])
                                      : const AssetImage("images/profileAvatar.png") as ImageProvider
                                    ),      
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ),
                Positioned(
                  child: SafeArea(
                    child: Container(
                      height: 70,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ) ,
                    ),
                  )
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}