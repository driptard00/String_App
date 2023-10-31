import 'package:dio/dio.dart';

import '../routes/api_routes.dart';
import '../storage/secureStorage.dart';

class ChatApiServices {

  // CREATE CHAT SERVICE
  static Future<Response?> createChatService(Map<String, dynamic> createChatDetails) async{
    try {
      String fullUrl = "$baseUrl$createChatRoute";

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

  // CREATE MESSAGE SERVICE
  static Future<Response?> createMessageService(Map<String, dynamic> createMessageDetails, String chatId) async{
    try {
      String fullUrl = "$baseUrl$createMessageRoute/$chatId/createmo";

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
  static Future<Response?> loadMessagesServices(String chatId) async{
    try {
      String fullUrl = "$baseUrl$loadMessageRoute$chatId";

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

  // SEND SEEN SERVICE
  static Future<Response?> sendAsSeen(String chatId, String senderId) async{
    try {
      String fullUrl = "$baseUrl/api/chat/$chatId/seen/$senderId";
      print(fullUrl);

      String token = await LocalStorage().fetchUserToken();

      var response = await Dio().put(
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

    // GET ALL USER CHAT SERVICE
  static Future<Response?> getConversationService() async{
    try {
      // String id = await LocalStorage().fetchUserId();
      String token = await LocalStorage().fetchUserToken();

      String fullUrl = "$baseUrl$getConversationsRoute";

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