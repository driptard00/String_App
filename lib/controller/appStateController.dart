import 'dart:io';

import 'package:String/model/userModel.dart';
import 'package:String/screens/Main/female/Chat/chatScreen.dart';
import 'package:String/screens/Main/female/Home/homeScreen.dart';
import 'package:String/services/payment_api_services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:String/screens/Main/Chat/chatScreen.dart';
import 'package:String/screens/Main/Home/homeScreen.dart';
import 'package:String/screens/Main/Profile/profileScreen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../screens/Main/Likes/likesScreen.dart';

class AppStateController extends GetxController{
  // Instant Variables
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    LikesScreen(),
    ChatScreen(),
    ProfileScreen()
  ];
  final List<Widget> _femaleScreen = [
    FemaleHomeScreen(),
    LikesScreen(),
    FemaleChatScreen(),
    ProfileScreen()
  ];
  int _selectedUser = 0;
  bool _isLoading = false;
  String _sentByMe = "Seun";
  List<dynamic> _chatList = [];

  MyUser _user = MyUser();

  List<Map<String, dynamic>> _paymentDetails = [
    {
      "type": "Bronze",
      "price": 6.99,
      "hearts": 220,
      "specials": "See who likes your profile",
      "description": "Buy Bronze Premium",
    },
    {
      "type": "Silver",
      "price": 17.99,
      "hearts": 640,
      "specials": "See who likes your profile",
      "description": "Buy Silver Premium",
    },
    {
      "type": "Gold",
      "price": 29.99,
      "hearts": 1020,
      "specials": "See who likes your profile",
      "description": "Buy Gold Premium",
    },
  ];
  final TextEditingController _msgTextController = TextEditingController();
  dynamic _selectedPlan = 0;

  // Getters
  int get selectedIndex => _selectedIndex;
  int get selectedUser=> _selectedUser;
  List get screens => _screens;
  List get femaleScreens => _femaleScreen;
  List get chatList => _chatList;
  List get paymentDetails => _paymentDetails;
  bool get isLoading => _isLoading;
  String get sentByMe => _sentByMe;
  TextEditingController get msgTextController => TextEditingController();
  dynamic get selectedPlan => _selectedPlan;


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
  updateSelectedPlan(value) {
    _selectedPlan = value;
    print(_selectedPlan);
    update();
  }

  Future<void> paymentTopUp(String userId, String email) async{
    updateIsLoading(true);

    Map<String, dynamic> _details = {
      "amount": _selectedPlan,
      "email": email
    };

    print(_details);

    var response = await PaymentApiService.paymentTopUpService(_details, userId);
    var responseData = response!.data;
    print(responseData);

    bool isSuccess = responseData["success"];

    if (isSuccess) {
      updateIsLoading(false);

      final Uri _url = Uri.parse(responseData["sessionUrl"]);
      launchUrl(_url);

      Future.delayed(
        const Duration(minutes: 4),
        (){
          verifyPaymentService(responseData["sessionId"]);
        }
      );

    }  else {
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
  }

  Future<void> verifyPaymentService(String sessionID) async{
    updateIsLoading(true);

    var response = await PaymentApiService.verifyPaymentServcie(sessionID);
    var responseData = response!.data;
    print(responseData);

    bool isSuccess = responseData["success"];

    if (isSuccess) {
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: "Payment verified successfully",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0
      );

      // getUserProfile();

    }  else {
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
  }
  

}