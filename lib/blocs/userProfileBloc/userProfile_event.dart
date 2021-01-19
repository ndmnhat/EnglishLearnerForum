import 'package:equatable/equatable.dart';
import 'package:EnglishLearnerForum/model/userProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object> get props => [];
}

class LoadUserProfile extends UserProfileEvent {
  final String userId;
  const LoadUserProfile(this.userId);
  @override
  List<Object> get props => [userId];
}

class UpdateUserProfile extends UserProfileEvent {
  final UserProfile updatedUserProfile;

  const UpdateUserProfile(this.updatedUserProfile);

  @override
  List<Object> get props => [updatedUserProfile];

  @override
  String toString() =>
      'UpdateUserProfile { updatedProfile: $updatedUserProfile }';
}

class UserProfileUpdated extends UserProfileEvent {
  final UserProfile userProfile;

  const UserProfileUpdated(this.userProfile);

  @override
  List<Object> get props => [userProfile];
}
