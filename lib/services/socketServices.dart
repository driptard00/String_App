import 'package:String/routes/api_routes.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../controller/chatController.dart';
import '../model/messgaes.dart';

// List<Map<String, dynamic>> chatMessages = [];

class SocketService {
  static IO.Socket? socket;

  ChatController _chatController = ChatController();

  static void initSocket() {
    socket = IO.io(baseUrl, <String, dynamic>{
      'transports': ['websocket'],
    });

    socket!.onConnect((_) {
      print('Connected to server');
    });

    socket!.onDisconnect((_) {
      print('Disconnected from server');
    });

    socket!.on('getOnlineUsers', (data) {
      // Handle received online users data
      print('Online users: $data');
    });

    socket!.on('getMessage', (message) {
      // Handle received message
      print('Received message: $message');
    });

    socket!.on('getNotification', (data) {
      // Handle received notification data
      print('Received notification: $data');
    });
  }

  static void closeSocket() {
    socket?.disconnect();
  }

  static void addNewUser(String userId) {
    socket?.emit('addNewUser', userId);
  }

  void sendMessage(Map<String, dynamic> message) {
    socket?.emit('sendMessage', message);
  }
}