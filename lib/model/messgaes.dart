// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

import 'dart:convert';

Message messageFromMap(String str) => Message.fromMap(json.decode(str));

String messageToMap(Message data) => json.encode(data.toMap());

class Message {
    String? senderId;
    String? chatId;
    String? message;
    String? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Message({
       this.senderId,
       this.chatId,
       this.message,
       this.id,
       this.createdAt,
       this.updatedAt,
       this.v,
    });

    factory Message.fromMap(Map<String, dynamic> json) => Message(
        senderId: json["senderId"],
        chatId: json["chatId"],
        message: json["message"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "senderId": senderId,
        "chatId": chatId,
        "message": message,
        "_id": id,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}
