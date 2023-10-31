// To parse this JSON data, do
//
//     final myUser = myUserFromJson(jsonString);

import 'dart:convert';

MyUser myUserFromMap(String str) => MyUser.fromMap(json.decode(str));

String myUserToMap(MyUser data) => json.encode(data.toMap());

class MyUser {
    String? id;
    String? name;
    String? email;
    List<dynamic>? likes;
    List<dynamic>? likedMe;
    String? status;
    List<String>? images;
    int? hearts;
    bool? profileSet;
    bool? isLoggedIn;
    bool? isActive;
    bool? isWorker;
    bool? online;
    dynamic workerId;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    dynamic otp;
    String? gender;
    String? bio;
    String? dating;
    DateTime? dob;
    String? haircolor;
    String? height;
    String? interests;
    String? kids;
    String? occupation;
    String? location;

    MyUser({
       this.id,
       this.name,
       this.email,
       this.likes,
       this.likedMe,
       this.status,
       this.images,
       this.hearts,
       this.profileSet,
       this.isLoggedIn,
       this.isActive,
       this.isWorker,
       this.online,
        this.workerId,
       this.createdAt,
       this.updatedAt,
       this.v,
        this.otp,
       this.gender,
       this.bio,
       this.dating,
       this.dob,
       this.haircolor,
       this.height,
       this.interests,
       this.kids,
       this.occupation,
        this.location,
    });

    factory MyUser.fromMap(Map<String, dynamic> json) => MyUser(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        likes: List<dynamic>.from(json["likes"].map((x) => x)),
        likedMe: List<dynamic>.from(json["likedMe"].map((x) => x)),
        status: json["Status"],
        images: List<String>.from(json["images"].map((x) => x)),
        hearts: json["hearts"],
        profileSet: json["profileSet"],
        isLoggedIn: json["isLoggedIn"],
        isActive: json["isActive"],
        isWorker: json["isWorker"],
        online: json["online"],
        workerId: json["workerId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        otp: json["otp"],
        gender: json["Gender"],
        bio: json["bio"],
        dating: json["dating"],
        dob: DateTime.parse(json["dob"]),
        haircolor: json["haircolor"],
        height: json["height"],
        interests: json["interests"],
        kids: json["kids"],
        occupation: json["occupation"],
        location: json["location"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "email": email,
        "likes": List<dynamic>.from(likes!.map((x) => x.toMap())),
        "likedMe": List<dynamic>.from(likedMe!.map((x) => x)),
        "Status": status,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "hearts": hearts,
        "profileSet": profileSet,
        "isLoggedIn": isLoggedIn,
        "isActive": isActive,
        "isWorker": isWorker,
        "online": online,
        "workerId": workerId,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
        "otp": otp,
        "Gender": gender,
        "bio": bio,
        "dating": dating,
        "dob": dob!.toIso8601String(),
        "haircolor": haircolor,
        "height": height,
        "interests": interests,
        "kids": kids,
        "occupation": occupation,
        "location": location,
    };
}
