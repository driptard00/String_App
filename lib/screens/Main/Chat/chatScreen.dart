import 'package:String/controller/chatController.dart';
import 'package:String/widgets/user_chat_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

import '../../../routes/app_route_names.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final ChatController _chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _chatController.getChatAllUsers();
    },);

    return GetBuilder<ChatController>(
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
                    // padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20,),
                        const Text(
                          'Chats',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontFamily: "Stinger"
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            height: 40,
                            width: Get.width,
                            child: TextFormField(
                              onChanged: (value){
                                controller.updateSearchQuery(value);
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                                hintText: "Search for chats",
                                hintStyle: const TextStyle(
                                  fontFamily: "Stinger"
                                )
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              const Text(
                                "Messages",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: "Stinger"
                                ),
                              ),
                              const SizedBox(width: 5),
                              Flexible(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffFEDC00),
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Text(
                                    controller.recentMessagesList.length.toString(),
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 15
                                    ),
                                  ),
                                )
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Expanded(
                          child: (controller.isLoading)?
                          const Center(
                            child: CircularProgressIndicator(
                              color: Color(0xffFEDC00),
                            ),
                          )
                          :
                          ListView.separated(
                            itemBuilder: ((context, index) {
                              // final filteredData = controller.recentMessagesList.where((item) {
                              //   final title = item[].toLowerCase();
                              //   final query = controller.searchQuery.toLowerCase();
                              //   return title.contains(query);
                              // }).toList();
                              return ListTile(
                                horizontalTitleGap: 2,
                                onTap: () {
                                  Get.toNamed(
                                    chatRoom,
                                    arguments: {
                                      "user": controller.recentMessagesList[index]["user"]
                                    }
                                  );
                                  _chatController.createChat(controller.recentMessagesList[index]["user"]["_id"]);
                                },
                                leading: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(controller.recentMessagesList[index]["user"]["images"][0]),
                                ),
                                title: Text(
                                  controller.recentMessagesList[index]["user"]["name"],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: "Stinger"
                                  ),
                                ),
                                subtitle: Text(
                                  controller.recentMessagesList[index]["lastMessage"]["message"],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: "Stinger"
                                  ),
                                ),
                                trailing: Column(
                                  children: [
                                    Text(
                                      controller.calculateTimeDifference(controller.recentMessagesList[index]["lastMessage"]["createdAt"]),
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xff4285F4),
                                        fontSize: 10
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5
                                    ),
                                    Flexible(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical:5),
                                        decoration: BoxDecoration(
                                          color: const Color(0xff4285F4),
                                          borderRadius: BorderRadius.circular(20)
                                        ),
                                        child: Text(
                                          controller.recentMessagesList[index]["unreadMessages"].toString(),
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 10
                                          ),
                                        ),
                                      )
                                    ),
                                  ]
                                )
                              );
                              // return InkWell(
                              //   onTap: () {
                              //     Get.toNamed(
                              //       chatRoom,
                              //       arguments: {
                              //         "user": controller.recentMessagesList[index]["user"]
                              //       }
                              //     );
                              //     _chatController.createChat(controller.recentMessagesList[index]["user"]["_id"]);
                              //   },
                              //   child: Container(
                              //     height: 70,
                              //     width: Get.width,
                              //     child: Row(
                              //       children: [
                              //         Expanded(
                              //           flex: 2,
                              //           child: Container(
                              //             child: CircleAvatar(
                              //               radius: 40,
                              //               backgroundImage: NetworkImage(controller.recentMessagesList[index]["user"]["images"][0]),
                              //             ),
                              //           ),
                              //         ),
                              //         const SizedBox(width: 10,),
                              //         Expanded(
                              //           flex: 8,
                              //           child: Container(
                              //             child: Column(
                              //               mainAxisAlignment: MainAxisAlignment.center,
                              //               children: [
                              //                 Container(
                              //                   child: Row(
                              //                     children: [
                              //                       Expanded(
                              //                         flex: 7,
                              //                         child: Text(
                              //                           controller.recentMessagesList[index]["user"]["name"],
                              //                           style: const TextStyle(
                              //                             color: Colors.black,
                              //                             fontSize: 15,
                              //                             fontFamily: "Stinger"
                              //                           ),
                              //                         ),
                              //                       ),
                              //                       Expanded(
                              //                         flex: 3,
                              //                         child: Container(
                              //                           alignment: Alignment.centerRight,
                              //                           child: Text(
                              //                             controller.calculateTimeDifference(controller.recentMessagesList[index]["lastMessage"]["createdAt"]),
                              //                             style: GoogleFonts.poppins(
                              //                               color: const Color(0xff4285F4),
                              //                               fontSize: 10
                              //                             ),
                              //                           ),
                              //                         ),
                              //                       ),
                              //                     ],
                              //                   ),
                              //                 ),    
                              //                 Container(
                              //                   child: Row(
                              //                     children: [
                              //                       Expanded(
                              //                         flex: 8,
                              //                         child: Text(
                              //                           controller.recentMessagesList[index]["lastMessage"]["message"],
                              //                           maxLines: 1,
                              //                           overflow: TextOverflow.ellipsis,
                              //                           style: const TextStyle(
                              //                             color: Colors.black,
                              //                             fontSize: 12,
                              //                             fontFamily: "Stinger"
                              //                           ),
                              //                         ),
                              //                       ),
                              //                       Expanded(
                              //                         flex: 2,
                              //                         child: Container(
                              //                           alignment: Alignment.centerRight,
                              //                           child: Flexible(
                              //                             child: Container(
                              //                               padding: const EdgeInsets.symmetric(horizontal: 10, vertical:5),
                              //                               decoration: BoxDecoration(
                              //                                 color: const Color(0xff4285F4),
                              //                                 borderRadius: BorderRadius.circular(20)
                              //                               ),
                              //                               child: Text(
                              //                                 controller.recentMessagesList[index]["unreadMessages"].toString(),
                              //                                 style: GoogleFonts.poppins(
                              //                                   color: Colors.white,
                              //                                   fontSize: 10
                              //                                 ),
                              //                               ),
                              //                             )
                              //                           ),
                              //                         ),
                              //                       ),
                              //                     ],
                              //                   ),
                              //                 ),                
                              //               ],
                              //             ),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // );
                            }), 
                            separatorBuilder: ((context, index) {
                              return const SizedBox(
                                height: 20,
                              );
                            }), 
                            itemCount: controller.recentMessagesList.length
                          ),
                        )
                      ],
                    ) ,
                  ),
                )
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              UserChatList.showUserChatList();
            },
            backgroundColor: const Color(0xffFEDC00),
            child: const HeroIcon(
              HeroIcons.plus,
              color: Colors.white,
              size: 30,
            ),
          ),
        );
      }
    );
  }
}