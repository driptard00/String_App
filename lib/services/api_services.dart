import 'dart:io';

import 'package:String/storage/secureStorage.dart';
import 'package:dio/dio.dart';
import 'package:String/routes/api_routes.dart';

class ApiServices {
  
  // SIGN UP USER SERVICE
  static Future<Response?> signUpUserService(Map<String, dynamic> signUpUserDetails, String urlRoute) async{
    try {
      String fullUrl = "$baseUrl$urlRoute";

      var response = await Dio().post(
        fullUrl,
        data: signUpUserDetails,
      );
      return response;
    } on DioError catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }

  // LOGIN USER SERVICE
  static Future<Response?> loginUserService(Map<String, dynamic> loginUserDetails, String urlRoute) async{
    try {
      String fullUrl = "$baseUrl$urlRoute";

      var response = await Dio().post(
        fullUrl,
        data: loginUserDetails,
      );
      return response;
    } on DioError catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }

  // VERIFY EMAIL SERVICE
  static Future<Response?> verifyEmailService(Map<String, dynamic> otpDetails, String urlRoute) async{
    try {
      String fullUrl = "$baseUrl$urlRoute";

      var response = await Dio().post(
        fullUrl,
        data: otpDetails,
      );
      return response;
    } on DioError catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }

  // FORGOT PASSWORD SERVICE
  static Future<Response?> forgotPasswordService(Map<String, dynamic> forgotPasswordDetails, String urlRoute) async{
    try {
      String fullUrl = "$baseUrl$urlRoute";

      var response = await Dio().post(
        fullUrl,
        data: forgotPasswordDetails,
      );
      return response;
    } on DioError catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }

  // GET ALL USER SERVICE
  static Future<Response?> getAllUserService(String urlRoute) async{
    try {
      String fullUrl = "$baseUrl$urlRoute";

      String token = await LocalStorage().fetchUserToken();
      print(token);

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

  // LIKE USER SERVICE
  static Future<Response?> likeUserService(String urlRoute, String userId, String otherId) async{
    try {
      String fullUrl = "$baseUrl$urlRoute$userId/like/$otherId";
      print(fullUrl);

      String token = await LocalStorage().fetchUserToken();
      print(token);


      var response = await Dio().post(
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

  // UNLIKE USER SERVICE
  static Future<Response?> unLikeUserService(String urlRoute, String userId, String otherId) async{
    try {
      String fullUrl = "$baseUrl$urlRoute$userId/unlike/$otherId";
      print(fullUrl);

      String token = await LocalStorage().fetchUserToken();
      print(token);

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

  // GET USER PROFILE SERVICE
  static Future<Response?> getUserProfileService(String urlRoute, String userId) async{
    try {
      String fullUrl = "$baseUrl$urlRoute$userId";

      String token = await LocalStorage().fetchUserToken();
      print(token);

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

  // SET USER IMAGE SERVICE
  static Future<Response?> setUserImageService(String urlRoute, String userId, List<dynamic> imageUrls) async{
    try {
      String fullUrl = "$baseUrl$urlRoute$userId";
      print(fullUrl);
      print(imageUrls);
      // print(filePath1.split("/").last);
  
      Map<String, dynamic> images = {
        "images": imageUrls
      };

      String token = await LocalStorage().fetchUserToken();
      print(token);

      var response = await Dio().post(
        fullUrl,
        data: images,
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

    // CREATE PROFILE USER  SERVICE
  static Future<Response?> createUserProfileService(Map<String, dynamic> setProfileDetails, String urlRoute, String userId) async{
    try {
      String fullUrl = "$baseUrl$urlRoute$userId";

      print("FULLURL:$fullUrl");

      String token = await LocalStorage().fetchUserToken();
      print(token);

      var response = await Dio().put(
        fullUrl,
        data: setProfileDetails,
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
  static Future<Response?> getAllUserChat(String urlRoute) async{
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

  // CREATE CHAT SERVICE
  static Future<Response?> createChatService(Map<String, dynamic> createChatDetails,String urlRoute) async{
    try {
      String fullUrl = "$baseUrl$urlRoute";

      var response = await Dio().post(
        fullUrl,
        data: createChatDetails
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

      var response = await Dio().post(
        fullUrl,
        data: createMessageDetails
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

  // DELETE USER SERVICE
  static Future<Response?> deleteUserService(String urlRoute, String userId) async{
    try {
      String fullUrl = "$baseUrl$urlRoute$userId";

      print("URL:: $fullUrl");

      String token = await LocalStorage().fetchUserToken();
      print(token);

      var response = await Dio().delete(
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