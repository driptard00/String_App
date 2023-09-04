import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../../controller/authStateController.dart';
import '../../../controller/chatController.dart';
import '../../../model/messgaes.dart';
import '../../../routes/api_routes.dart';

class ChatRoom extends StatefulWidget {
  ChatRoom({super.key});


  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {

  final userDetails = Get.arguments["user"];

  final ChatController _chatController = Get.put(ChatController());

  late IO.Socket _socket;
  TextEditingController _msgTextController = TextEditingController();
  final AuthStateController _authStateController = Get.find<AuthStateController>();

  sendMessage(String message) {
    _socket.emit("sendMessage", {
      "senderId": _authStateController.user.id,
      "chatId": _authStateController.chatId,
      "message": message,
      // "_id": "",
      "createdAt": DateTime.now().toString(),
      "updatedAt": DateTime.now().toString(),
      "__v": 0
    });
  }

  void _connectToSocket() {
    _socket = IO.io(
      baseUrl,
      IO.OptionBuilder().setTransports(['websocket']).enableAutoConnect().build()
    );

    _socket.on('error', (data) {
      print('Socket error: $data');
    });

    _socket.on('disconnect', (data) {
      print('Socket disconnected: $data');
    });

    _socket.on('getMessage', (data) {
      // Handle the received event data
      print('Received event: $data');
      _chatController.updateChatList(data);
    });

    _socket.connect();

    setState(() {
      
    });
  }

  @override
  void initState() {
    super.initState();
    _chatController.getAllMessages(userDetails["_id"], _authStateController.chatId);
    _connectToSocket();
  }

  @override
  void dispose() {
    _msgTextController.dispose();
    super.dispose();
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
                          child:  (controller.isLoading)?
                            const Text(
                              "Loading messages...",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "Stinger"
                              ),
                            )
                          :
                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: ListView.separated(
                              itemCount: controller.chatList.length,
                              // reverse: true,
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 5);
                              },
                              itemBuilder: (context, index) {
                                final message = controller.chatList[index];
                                final senderId = controller.userId;
                                print("SenderId::::$senderId");
                                
                                return Align(
                                  alignment: message["senderId"] == controller.userId ? Alignment.centerRight : Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                      decoration: BoxDecoration(
                                        color: message["senderId"] == controller.userId ? const Color(0xffFEDC00) : const Color(0xffD9D9D9),
                                        borderRadius: message["senderId"] == controller.userId
                                            ? const BorderRadius.only(
                                                topLeft: Radius.circular(30),
                                                topRight: Radius.circular(30),
                                                bottomLeft: Radius.circular(30),
                                                bottomRight: Radius.circular(3),
                                              )
                                            : const BorderRadius.only(
                                                topLeft: Radius.circular(30),
                                                topRight: Radius.circular(30),
                                                bottomLeft: Radius.circular(3),
                                                bottomRight: Radius.circular(30),
                                              ),
                                      ),
                                      child: Text(
                                        message["message"],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Stinger",
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),

                            ),
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
                                        controller: _msgTextController,
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
                                        onPressed: () {
                                          if (_authStateController.user.hearts == 0){
                                            Fluttertoast.showToast(
                                              msg: "Insufficient Hearts!!!",
                                              toastLength: Toast.LENGTH_LONG,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 15.0
                                            );
                                          } else {
                                            if(_msgTextController.text.isNotEmpty){
                                              sendMessage(_msgTextController.text);
                                              controller.createMessage(_msgTextController.text, controller.chatId);
                                              _msgTextController.clear();
                                            } 
                                          }
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
  
  // void sendMessage(String text){
  //   setState(() {
  //     var messageJson = {
  //       "message": text,
  //       "sentByMe": socket!.id
  //     };
  //     socket!.emit("sendMessage", messageJson);
  //     chatController.chatMessages.add(Message.fromJson(messageJson));
  //   });
  // }

  // setUpSocketListener() {
  //   socket!.on("getMessage", (message) {
  //     print("Message:::$message");
  //     chatController.chatMessages.add(Message.fromJson(message));
  //   });

  // }

}