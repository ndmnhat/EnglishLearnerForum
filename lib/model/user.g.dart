// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['displayName'] as String,
    json['email'] as String,
    json['role'] as String,
    json['phoneNumber'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'displayName': instance.displayName,
      'email': instance.email,
      'role': instance.role,
      'phoneNumber': instance.phoneNumber,
    };