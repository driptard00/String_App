import 'package:String/routes/api_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:String/controller/appStateController.dart';
import 'package:heroicons/heroicons.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../controller/authStateController.dart';
import '../../controller/chatController.dart';
import '../../storage/secureStorage.dart';

class HolderScreen extends StatefulWidget {
  HolderScreen({super.key});

    @override
  State<HolderScreen> createState() => _HolderScreenState();
}

class _HolderScreenState extends State<HolderScreen> {

  final AppStateController _appStateController = Get.put(AppStateController());
  final AuthStateController _authStateController = Get.put(AuthStateController());
  final ChatController _chatController = Get.put(ChatController());


  late IO.Socket _socket;
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
      _chatController.updateChatList(data);
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
      _chatController.getAllConversations();
    });

    _socket.connect();

    setState(() {
      
    });
  }


  @override
  void initState() {
    _connectToSocket();
    _authStateController.getUserProfile();
    _authStateController.getAllUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GetBuilder<AppStateController>(
      builder: (controller) {
        return Scaffold(
          body: (controller.isLoading)?
          Center(
            child: Container(
              height: Get.height,
              width: Get.width,
              color: Colors.black,
              child: const CircularProgressIndicator(
                color: Color(0xffFEDC00),
              ),
            ),
          )
          :
          controller.screens[controller.selectedIndex],
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