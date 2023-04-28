import 'package:String/routes/api_routes.dart';
import 'package:String/services/api_services.dart';
import 'package:String/storage/secureStorage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:String/screens/Main/Chat/chatScreen.dart';
import 'package:String/screens/Main/Home/homeScreen.dart';
import 'package:String/screens/Main/Profile/profileScreen.dart';

import '../screens/Main/LikesScreen/likesScreen.dart';

class AppStateController extends GetxController{
  // Instant Variables
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    LikesScreen(),
    ChatScreen(),
    ProfileScreen()
  ];

  int _selectedUser = 0;

  bool _isLoading = false;
  String _sentByMe = "Seun";

  List<dynamic> _chatList = [];

  List<dynamic> _dummyChatList = [
    {
      "name": "Seun",
      "dateOfMessage": "2020-05-03",
      "timeOfMessage": "8:00am",
      "text": "Hello",
    },
    {
      "name": "Seun",
      "dateOfMessage": "2020-05-03",
      "timeOfMessage": "8:01am",
      "text": "Can u send me your answers",
    },
    {
      "name": "Godwin",
      "dateOfMessage": "2020-05-03",
      "timeOfMessage": "8:25am",
      "text": "Fuck u bro",
    },
    {
      "name": "Godwin",
      "dateOfMessage": "2020-05-04",
      "timeOfMessage": "10:00am",
      "text": "Ok i will send it later",
    },
    {
      "name": "Seun",
      "dateOfMessage": "2020-05-07",
      "timeOfMessage": "1:00am",
      "text": "Thanks bro u be slatt :)",
    },
    {
      "name": "Seun",
      "dateOfMessage": "2020-05-09",
      "timeOfMessage": "12:34pm",
      "text": "Omo how far the assignment na",
    },
    {
      "name": "Seun",
      "dateOfMessage": "2020-05-09",
      "timeOfMessage": "12:35am",
      "text": "If u no give me ba",
    },
    {
      "name": "Seun",
      "dateOfMessage": "2020-05-09",
      "timeOfMessage": "12:40am",
      "text": "Lala go hear am",
    },
  ];

  final TextEditingController _msgTextController = TextEditingController();


  // Getters
  int get selectedIndex => _selectedIndex;
  int get selectedUser=> _selectedUser;
  List get screens => _screens;
  List get chatList => _chatList;
  List get dummyChatList => _dummyChatList;

  bool get isLoading => _isLoading;
  String get sentByMe => _sentByMe;
  TextEditingController get msgTextController => TextEditingController();


  // Setters
  updateSelectedIndexItem(value) {
    _selectedIndex = value;
    update();
  }
  updateSelectedUser(value) {
    _selectedUser = value;
    update();
  }
  updateIsLoading(value) {
    _isLoading = value;
    update();
  }
  updateChatList(value) {
    _chatList = value;
    update();
  }
  updateSentByMe(value) {
    _sentByMe = value;
    update();
  }

  // CREATE CHAT
  Future<void> createChat(String recieverId) async{
    updateIsLoading(true);

    String senderId = await LocalStorage().fetchUserId();

    Map<String, dynamic> chatDetails = {
      "senderId": senderId,
      "recieverId": recieverId
    };

    var response = await ApiServices.createChatService(chatDetails, createChatRoute);
    var responseData = response!.data;

    bool isSuccess = responseData["success"];

    if(isSuccess){
      updateIsLoading(false);


    }

    update();
  }

  // GET MESSAGES 
  Future<void> getMessages(String chatId) async {
    updateIsLoading(true);

    var response = await ApiServices.getMessageService(getMessagesROute, chatId);
    var responseData = response!.data;

    bool isSuccess = responseData["status"];

    if(isSuccess){
      updateIsLoading(false);

      updateChatList(responseData["data"]["new"]);

    }
    
    update();    
  }

  
}