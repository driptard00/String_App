import 'package:dio/dio.dart';

import '../routes/api_routes.dart';
import '../storage/secureStorage.dart';

class PaymentApiService {

  static Future<Response?> paymentTopUpService(Map<String, dynamic> details, String id) async{
    try {
      String fullUrl = "$baseUrl$heartTopUpRoute$id";

      String token = await LocalStorage().fetchUserToken();
      print(token);
      
      var response = await Dio().post(
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

  static Future<Response?> verifyPaymentServcie(String id) async{
    try {
      String fullUrl = "$baseUrl$verifyPaymentRoute$id";

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

}