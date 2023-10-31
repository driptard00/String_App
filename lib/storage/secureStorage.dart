import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage{

  final FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();

  // STORE ID
  storeUserId(String userId) async{
    try {
      await _flutterSecureStorage.write(key: "UserId", value: userId);
      print("Saved Id");
    } catch (e) {
      print(e);
      print("Could not save id");
    }
  }

  // FETCH ID
  Future<String> fetchUserId() async{
    String userId = await _flutterSecureStorage.read(key: "UserId") ?? "";
    print("Fetched Id successful");

    return userId;
  }

  // STORE TOKEN
  storeUserToken(String token) async{
    try {
      await _flutterSecureStorage.write(key: "Token", value: token);
      print("Saved Id");
    } catch (e) {
      print(e);
      print("Could not save token");
    }
  }

  // FETCH TOKEN
  Future<String> fetchUserToken() async{
    String token = await _flutterSecureStorage.read(key: "Token") ?? "";
    print("Fetched token successful");

    return token;
  }

  // STORE MESSAGE LIST
  storeMessageList(List<String> messageList) async{
    try {
      final SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
      await _sharedPreferences.setStringList('messageList', messageList);
    } catch (e) {
      print(e);
      print("Could not save List");
    }
  }

  // STORE DEVICE ID
  storeDeviceId(String deviceID) async{
    try {
      await _flutterSecureStorage.write(key: "DeviceID", value: deviceID);
      print("Saved Id");
    } catch (e) {
      print(e);
      print("Could not save id");
    }
  }

  // FETCH DEVICE ID
  Future<String> fetchDeviceID() async{
    String deviceID = await _flutterSecureStorage.read(key: "DeviceID") ?? "";
    print("Fetched Id successful");

    return deviceID;
  }

  // STORE DEVICE ID
  storeUserType(String deviceID) async{
    try {
      await _flutterSecureStorage.write(key: "USERTYPE", value: deviceID);
      print("Saved type");
    } catch (e) {
      print(e);
      print("Could not save id");
    }
  }

  // FETCH DEVICE ID
  Future<String> fetchUSERTYPE() async{
    String deviceID = await _flutterSecureStorage.read(key: "USERTYPE") ?? "";
    print("Fetched Id successful");

    return deviceID;
  }

  // DELETE USER FROM STORAGE
  Future<void> deleteUserStorage() async{
    await _flutterSecureStorage.deleteAll();
    print("Deleted Storage :)");
  }
  
}