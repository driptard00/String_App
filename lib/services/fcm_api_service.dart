import 'package:dio/dio.dart';

import '../routes/api_routes.dart';
import '../storage/secureStorage.dart';

class FCMApiService {
  // UPDATE FCM TOKEN
  static Future<Response?> updateFcmService(dynamic details) async{
    try {
      String fullUrl = "$baseUrl$updateFcmRoute";
      print(fullUrl);

      String token = await LocalStorage().fetchUserToken();
      print(token);

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
}