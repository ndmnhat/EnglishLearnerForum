import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  User(
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

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
  factory User.fromSnapshot(DocumentSnapshot snap) =>
      User.fromJson(snap.data());
  Map<String, dynamic> toDocument() => <String, dynamic>{
        'displayName': displayName,
        'email': email,
        'role': role,
        'phoneNumber': phoneNumber,
      };
}
