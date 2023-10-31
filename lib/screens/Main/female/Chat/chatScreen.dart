import 'package:String/controller/chatController.dart';
import 'package:String/routes/api_routes.dart';
import 'package:String/storage/secureStorage.dart';
import 'package:String/widgets/user_chat_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../../routes/app_route_names.dart';

class FemaleChatScreen extends StatefulWidget {
  const FemaleChatScreen({super.key});

  @override
  State<FemaleChatScreen> createState() => _FemaleChatScreenState();
}

class _FemaleChatScreenState extends State<FemaleChatScreen> {

  final ChatController _chatController = Get.put(ChatController());
  // final AuthStateController _authStateController = Get.put(AuthStateController());

  late IO.Socket _socket;
  TextEditingController _msgTextController = TextEditingController();
  String userId = "";

  void _connectToSocket() async {
    userId = await LocalStorage().fetchUserId();
    print("USERRRRIDDDDD:::::$userId");

    _socket = IO.io(
        "$baseUrl?auth=$userId",
        IO.OptionBuilder().setTransports(['websocket'])
        .enableReconnection()
        .enableForceNewConnection()
        .enableAutoConnect()
        .build()
    );

    _socket.on('error', (data) {
      print('Socket error: $data');
    });

    _socket.on('disconnect', (data) {
      print('Socket disconnected: $data');
    });

    _socket.on('connect', (data) {
      print('Socket Connected!!!!');
    });

    _socket.on('message', (data) {
      // Handle the received event data
      print('Received event: $data');
      // _chatController.updateChatList(data);
    });

    // _socket.on('read', (data) {
    //   // Handle the received event data
    //   print('Received event: $data');
    //   // _chatController.updateReadID(data["_chat"]);
    //   _chatController.markMessageRead(data["_chat"], userID);

    // });

    _socket.on('chat', (data) {
      // Handle the received event data
      print('Received event: $data');
      // _chatController.getAllConversations();
    });

    _socket.connect();

    setState(() {
      
    });
  }


  @override
  void initState() {
    _connectToSocket();
    // _chatController.getAllConversations();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

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
                          (controller.recentMessagesList.isEmpty )?
                          const Center(
                            child: Text(
                              "No Messages",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: "Stinger"
                              ),
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
                                      "user": controller.recentMessagesList[index]["user"],
                                      "chatID": controller.recentMessagesList[index]["_id"],
                                    }
                                  );
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
                                subtitle: (controller.recentMessagesList[index]["lastMessage"].isEmpty)?
                                const Text(
                                  "No Messages, Click to begin",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: "Stinger"
                                  ),
                                )
                                :
                                Text(
                                  controller.recentMessagesList[index]["lastMessage"]["body"].toString(),
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
                                      (controller.recentMessagesList[index]["lastMessage"].isEmpty)?
                                      ""
                                      :
                                      controller.calculateTimeDifference(controller.recentMessagesList[index]["lastMessage"]["createdAt"]),
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xff4285F4),
                                        fontSize: 10
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15
                                    ),  
                                    (controller.recentMessagesList[index]["lastMessage"].isNotEmpty)?
                                    (controller.recentMessagesList[index]["lastMessage"]["_sender"] != userId && !controller.recentMessagesList[index]["lastMessage"]["read"])?
                                    Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff4285F4),
                                        borderRadius: BorderRadius.circular(20)
                                      ),
                                      alignment: Alignment.center,
                                    )
                                    :
                                    SizedBox()
                                    :
                                    SizedBox()
                                  ]
                                )
                              );
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
              // UserChatList.showUserChatList();
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