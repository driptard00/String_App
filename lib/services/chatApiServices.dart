import 'package:dio/dio.dart';

import '../routes/api_routes.dart';
import '../storage/secureStorage.dart';

class ChatApiServices {


  // CREATE CHAT SERVICE
  static Future<Response?> createChatService(Map<String, dynamic> createChatDetails,String urlRoute) async{
    try {
      String fullUrl = "$baseUrl$urlRoute";

      String token = await LocalStorage().fetchUserToken();
      print(token);

      var response = await Dio().post(
        fullUrl,
        data: createChatDetails,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }
        )
      );
      return response;
    } on DioError catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }

  // GET SINGLE USER CHAT SERVICE
  static Future<Response?> getSingleUserChat(String urlRoute) async{
    try {
      String fullUrl = "$baseUrl$urlRoute";

      var response = await Dio().get(
        fullUrl,
      );
      return response;
    } on DioError catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }

  // GET BOTH USER CHAT SERVICE
  static Future<Response?> getBothUserChatService(String urlRoute) async{
    try {
      String fullUrl = "$baseUrl$urlRoute";

      var response = await Dio().get(
        fullUrl,
      );
      return response;
    } on DioError catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }

  // CREATE MESSAGE SERVICE
  static Future<Response?> createMessageService(Map<String, dynamic> createMessageDetails,String urlRoute) async{
    try {
      String fullUrl = "$baseUrl$urlRoute";

      String token = await LocalStorage().fetchUserToken();

      var response = await Dio().post(
        fullUrl,
        data: createMessageDetails,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }
        )
      );
      return response;
    } on DioError catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }

  // GET MESSAGE SERVICE
  static Future<Response?> getMessageService(String urlRoute, String chatId) async{
    try {
      String fullUrl = "$baseUrl$urlRoute$chatId";

      var response = await Dio().get(
        fullUrl,
      );
      
      return response;
    } on DioError catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }

  // GET CHAT MESSAGES SERVICE
  static Future<Response?> getChatMessages(String chatId, String senderId, String recieverId) async{
    try {
      String fullUrl = "$baseUrl$getChatsMessagesRoute$chatId/$senderId/$recieverId";
      print(fullUrl);

      String token = await LocalStorage().fetchUserToken();

      var response = await Dio().get(
        fullUrl,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }
        )
      );
      
      return response;
    } on DioError catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }

}