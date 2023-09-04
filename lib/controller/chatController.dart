import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../model/messgaes.dart';
import '../model/userModel.dart';
import '../routes/api_routes.dart';
import '../routes/app_route_names.dart';
import '../services/api_services.dart';
import '../services/chatApiServices.dart';
import '../storage/secureStorage.dart';

class ChatController extends GetxController {
  List<dynamic> _chatList = [];
  List<dynamic> _recentMessagesList = [];
  bool _isLoading = false;
  Message _chatMessages = Message();
  String _chatId = "";
  String _senderID = "";
  String _userId = "";
  String _rImage = "";
  String _rId = "";
  String _rLastMessage = "";
  String _rName = "";
  MyUser _user = MyUser();
  String _searchQuery = "";

  // getters
  String get chatId => _chatId;
  String get senderID => _senderID;
  String get userId => _userId;
  MyUser get user => _user;
  List<dynamic> get chatList => _chatList;
  List<dynamic> get recentMessagesList => _recentMessagesList;
  String get rImage => _rImage;
  String get rId => _rId;
  String get rLastMessage => _rLastMessage;
  String get rName => _rName;
  bool get isLoading => _isLoading;
  String get searchQuery => _searchQuery;

  // setters
  updateIsLoading(value) {
    _isLoading = value;
    update();
  }
  updateChatId(value) {
    _chatId = value;
    update();
  }
  updateChatList(value) {
    _chatList.add(value);
    update();
  }
  updateChatList1(value) {
    _chatList = value;
    update();
  }
  updateUserId(value) {
    _userId = value;
    update();
  }
  updateRId(value) {
    _rId = value;
    update();
  }
  updateRImage(value) {
    _rImage = value;
    update();
  }
  updateRName(value) {
    _rName = value;
    update();
  }
  updateRecentMessagesList(value) {
    _recentMessagesList = value;
    update();
  }
  updateSearchQuery(value) {
    _searchQuery = value;
    update();
  }

  // CALCULATE TIME STAMP
  String calculateTimeDifference(String createdAt) {
    final createdAtDateTime = DateTime.parse(createdAt);
    final now = DateTime.now();
    final difference = now.difference(createdAtDateTime);

    if (difference.inDays > 0) {
      return DateFormat('MMM d').format(createdAtDateTime);
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  // CREATE CHAT
  Future<void> createChat(String receiverId) async{
    updateIsLoading(true);

    String senderId = await LocalStorage().fetchUserId();
    updateUserId(senderId);
    
    Map<String, dynamic> chatDetails = {
      "senderId": senderId,
      "receiverId": receiverId
    };
    print(chatDetails);

    var response = await ChatApiServices.createChatService(chatDetails, createChatRoute);
    var responseData = response!.data;
    print(responseData);

    bool isSuccess = responseData["success"];

    if(isSuccess){
      updateIsLoading(false);

      updateChatId(responseData["result"]["_id"]);
      print(_chatMessages); 

      getAllMessages(receiverId, chatId);

    } else if (responseData["error"] == "jwt expired") {
      logoutAuth();
    }

    update();

  }

  // CREATE MESSAGE
  Future<void> createMessage(String message, String chatId) async{

    String senderId = await LocalStorage().fetchUserId();

    Map<String, dynamic> messageDetails = {
      "chatId": chatId,
      "senderId": senderId,
      "message": message
    };
    
    print(messageDetails);

    var response = await ChatApiServices.createMessageService(messageDetails, createMessageRoute);
    var responseData = response!.data;
    print(responseData);

    bool isSuccess = responseData["success"];

    if(isSuccess){
      updateIsLoading(false);

    } 

    update();
  }

  // CREATE CHAT
  Future<void> getAllMessages(String receiverId, String chatId) async{
    updateIsLoading(true);

    String senderId = await LocalStorage().fetchUserId();

    var response = await ChatApiServices.getChatMessages(chatId, senderId, receiverId);
    var responseData = response!.data;
    print("Chat List:::::$responseData");

    bool isSuccess = responseData["success"];

    if(isSuccess){
      updateIsLoading(false);

      // List<dynamic> dynamicList = responseData["result"];
      // List<Message> messageList = dynamicList.map((dynamicItem) {
      //   // Convert the dynamicItem to a Message object
      //   return Message.fromMap(dynamicItem); // Assuming you have a fromJson method in the Message class
      // }).toList();

      updateChatList1(responseData["result"]);
    
    }

    update();
  }

    // LOGOUT AUTH
  Future<void> logoutAuth() async{
    var response = await ApiServices.logoutService();
    var responseData = response!.data;

    print("RESPONSEDATA:::$responseData");

    bool isSuccess = responseData["success"];

    if(isSuccess){
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: "Logout Successful!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0
      );

      await LocalStorage().deleteUserStorage();

      Get.offAllNamed(signinScreen);

    }else{
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: responseData["error"],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }
  }

  // GET USER PROFILE
  Future<void> getUserProfile(String id) async{
    updateIsLoading(true);

    var response = await ApiServices.getUserProfileService(getProfileRoute, id);
    var responseData = response!.data;

    print(responseData);

    bool isSuccess = responseData["success"];

    if(isSuccess){
      updateIsLoading(false); 

    } else{
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: "Failed",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }

    update();
  }

  // GET ALL USERS CHAT
  Future<void> getChatAllUsers() async{
    updateIsLoading(true);

    var response = await ApiServices.getAllUserChat(getUserChatsRoute);
    var responseData = response!.data;

    print(responseData);

    bool isSuccess = responseData["success"];

    if(isSuccess){
      updateIsLoading(false); 

      updateRecentMessagesList(responseData["result"]);

    } else{
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: "Failed",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }

    update();
  }
}