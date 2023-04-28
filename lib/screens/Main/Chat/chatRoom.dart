import 'package:String/controller/appStateController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:heroicons/heroicons.dart';

class ChatRoom extends StatelessWidget {
  ChatRoom({super.key});

  final userDetails = Get.arguments["user"];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppStateController>(
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
                child: SafeArea(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage(userDetails["images"][0]),
                                ),
                                const SizedBox(width: 10,),
                                Text(
                                  userDetails["name"],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "Stinger"
                                  ),
                                )
                              ],
                            ),
                          )
                        ),
                        const Divider(
                          color: Colors.black,
                        ),
                        Expanded(
                          flex: 15,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child:  GroupedListView<dynamic, String>(
                              elements: controller.dummyChatList,
                              groupBy: (element) => element['dateOfMessage'],
                              groupSeparatorBuilder: (String groupByValue) {
                                return Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      groupByValue,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12
                                      ),
                                    ),
                                  ),
                                );
                              },
                              indexedItemBuilder: (context, element, index) {
                                return Align(
                                  alignment: (controller.dummyChatList[index]["name"] == "Seun")?
                                  Alignment.centerRight
                                  :
                                  Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                      decoration: BoxDecoration(
                                        color: (controller.dummyChatList[index]["name"] == "Seun")?
                                        const Color(0xffFEDC00)
                                        :
                                        const Color(0xffD9D9D9),
                                        borderRadius: (controller.dummyChatList[index]["name"] == "Seun")?
                                        const BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(3),
                                        )
                                        :
                                        const BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(3),
                                          bottomRight: Radius.circular(30),
                                        )
                                      ),
                                      child: Text(
                                        element["text"],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Stinger",
                                          fontSize: 15
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              floatingHeader: true, // optional
                            ),
                          )
                        ),
                        Flexible(
                          flex: 3,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  // color: Colors.white,
                                  borderRadius: BorderRadius.circular(25.0),
                                  border: Border.all(
                                    color: Colors.black
                                  )
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 8,
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: 'Type a message',
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: IconButton(
                                        onPressed: (){
                                          
                                        }, 
                                        icon: const HeroIcon(
                                          HeroIcons.paperAirplane,
                                          color: Colors.black,
                                          size: 30,
                                          style: HeroIconStyle.outline,
                                        )
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ) ,
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