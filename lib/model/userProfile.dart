import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
part 'userProfile.g.dart';

@JsonSerializable()
class UserProfile {
  UserProfile(
      {this.id,
      @required this.displayName,
      @required this.email,
      @required this.role,
      @required this.phoneNumber,
      this.avatarURL});
  String id;
  String displayName;
  String email;
  String role;
  String phoneNumber;
  String avatarURL;
  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
  factory UserProfile.fromSnapshot(DocumentSnapshot snap) {
    return UserProfile(
      id: snap.id,
      displayName: snap.data()['displayName'] as String,
      email: snap.data()['email'] as String,
      role: snap.data()['role'] as String,
      phoneNumber: snap.data()['phoneNumber'] as String,
      avatarURL: snap.data()['avatarURL'] as String,
    );
  }
  Map<String, dynamic> toDocument() => <String, dynamic>{
        'displayName': displayName,
        'email': email,
        'role': role,
        'phoneNumber': phoneNumber,
        'avatarURL': avatarURL,
      };
}
