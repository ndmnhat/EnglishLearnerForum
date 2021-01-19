// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userProfile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return UserProfile(
    id: json['id'] as String,
    displayName: json['displayName'] as String,
    email: json['email'] as String,
    role: json['role'] as String,
    phoneNumber: json['phoneNumber'] as String,
  );
}

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'email': instance.email,
      'role': instance.role,
      'phoneNumber': instance.phoneNumber,
    };
