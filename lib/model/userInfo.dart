import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
part 'userInfo.g.dart';

@JsonSerializable()
class UserInfo {
  UserInfo(
      {this.id,
      @required this.displayName,
      @required this.email,
      @required this.role,
      @required this.phoneNumber});
  String id;
  String displayName;
  String email;
  String role;
  String phoneNumber;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
  factory UserInfo.fromSnapshot(DocumentSnapshot snap) =>
      UserInfo.fromJson(snap.data());
  Map<String, dynamic> toDocument() => <String, dynamic>{
        'displayName': displayName,
        'email': email,
        'role': role,
        'phoneNumber': phoneNumber,
      };
}
