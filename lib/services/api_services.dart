import 'dart:io';

import 'package:String/storage/secureStorage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:String/routes/api_routes.dart';

class ApiServices {
  
  // SIGN UP USER SERVICE
  static Future<Response?> signUpUserService(Map<String, dynamic> signUpUserDetails, String urlRoute) async{
    try {
      String fullUrl = "$baseUrl$urlRoute";
      Dio().interceptors.add(
        InterceptorsWrapper(
          onError: (e, handler) {
            
          },
        )
      );
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
      String id = await LocalStorage().fetchUserId();
      String token = await LocalStorage().fetchUserToken();

      String fullUrl = "$baseUrl$urlRoute$id";

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

  // RESEND VERIFICATION
  static Future<Response?> resendVerification(String urlRoute,) async{
    try {
      String fullUrl = "$baseUrl$urlRoute";

      print("URL:: $fullUrl");


      var response = await Dio().post(
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

  // EDIT PROFILE IMAGE
  static Future<Response?> editProfileImageService(String userId, int imageIndex, Map<String, dynamic> details) async{
    try {
      String fullUrl = "$baseUrl$editProfileImageRoute$userId/images/$imageIndex";
      print(fullUrl);

      print("URL:: $fullUrl");

      String token = await LocalStorage().fetchUserToken();

      var response = await Dio().put(
        fullUrl,
        data: details,
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

  // LOGOUT SERVICE
  static Future<Response?> logoutService() async{
    try {
      String fullUrl = "$baseUrl$logoutRoute";
      print(fullUrl);

      var response = await Dio().post(
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

}