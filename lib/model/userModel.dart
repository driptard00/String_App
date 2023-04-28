// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

MyUser userFromMap(String str) => MyUser.fromMap(json.decode(str));

String userToMap(MyUser data) => json.encode(data.toMap());

class MyUser {
    MyUser({
     this.hearts,
     this.id,
     this.name,
     this.email,
     this.likes,
     this.likedMe,
     this.status,
     this.images,
     this.balance,
     this.profileSet,
     this.isActive,
     this.createdAt,
     this.updatedAt,
     this.v,
     this.gender,
     this.bio,
     this.dating,
     this.dob,
     this.haircolor,
     this.height,
     this.interests,
     this.kids,
     this.occupation,
    });

    int? hearts;
    String? id;
    String? name;
    String? email;
    List<dynamic>? likes;
    List<dynamic>? likedMe;
    String? status;
    List<dynamic>? images;
    int? balance;
    bool? profileSet;
    bool? isActive;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    String? gender;
    String? bio;
    String? dating;
    DateTime? dob;
    String? haircolor;
    String? height;
    String? interests;
    String? kids;
    String? occupation;

    factory MyUser.fromMap(Map<String, dynamic> json) => MyUser(
        hearts: json["hearts"],
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        likes: List<dynamic>.from(json["likes"].map((x) => x)),
        likedMe: List<dynamic>.from(json["likedMe"].map((x) => x)),
        status: json["Status"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
        balance: json["balance"],
        profileSet: json["profileSet"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        gender: json["Gender"],
        bio: json["bio"],
        dating: json["dating"],
        dob: DateTime.parse(json["dob"]),
        haircolor: json["haircolor"],
        height: json["height"],
        interests: json["interests"],
        kids: json["kids"],
        occupation: json["occupation"],
    );

    Map<String, dynamic> toMap() => {
        "hearts": hearts,
        "_id": id,
        "name": name,
        "email": email,
        "likes": List<dynamic>.from(likes!.map((x) => x)),
        "likedMe": List<dynamic>.from(likedMe!.map((x) => x)),
        "Status": status,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "balance": balance,
        "profileSet": profileSet,
        "isActive": isActive,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
        "Gender": gender,
        "bio": bio,
        "dating": dating,
        "dob": dob!.toIso8601String(),
        "haircolor": haircolor,
        "height": height,
        "interests": interests,
        "kids": kids,
        "occupation": occupation,
    };
}
