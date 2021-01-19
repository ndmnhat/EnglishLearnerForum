import 'package:equatable/equatable.dart';
import 'package:EnglishLearnerForum/model/userProfile.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object> get props => [];
}

class UserProfileLoading extends UserProfileState {}

class UserProfileLoaded extends UserProfileState {
  final UserProfile userProfile;

  const UserProfileLoaded(this.userProfile);

  @override
  List<Object> get props => [userProfile];

  @override
  String toString() => 'UserProfileLoaded { profile: $userProfile }';
}

class UserProfileNotLoaded extends UserProfileState {}
