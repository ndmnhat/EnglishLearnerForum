import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:EnglishLearnerForum/repositories/user_repository.dart';
import 'package:EnglishLearnerForum/blocs/userProfileBloc/userProfile.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final UserRepository _userProfileRepository;
  UserProfileBloc({@required userProfileRepository})
      : assert(userProfileRepository != null),
        _userProfileRepository = userProfileRepository,
        super(UserProfileLoading());

  @override
  Stream<UserProfileState> mapEventToState(UserProfileEvent event) async* {
    if (event is LoadUserProfile) {
      yield* _mapLoadUserProfilesToState(event);
    } else if (event is UpdateUserProfile) {
      yield* _mapUpdateUserProfileToState(event);
    } else if (event is UserProfileUpdated) {
      yield* _mapUserProfileUpdatedToState(event);
    } else if (event is UpdateUserAvatar) {
      yield* _mapUpdateUserAvatarToState(event);
    }
  }

  Stream<UserProfileState> _mapLoadUserProfilesToState(
      LoadUserProfile event) async* {
    _userProfileRepository.getUserProfile(event.userId).listen(
          (userProfile) => add(UserProfileUpdated(userProfile)),
        );
  }

  Stream<UserProfileState> _mapUpdateUserProfileToState(
      UpdateUserProfile event) async* {
    _userProfileRepository.updateUserProfile(event.updatedUserProfile);
  }

  Stream<UserProfileState> _mapUpdateUserAvatarToState(
      UpdateUserAvatar event) async* {
    _userProfileRepository.updateUserAvatar(event.updatedUserAvatar);
  }

  Stream<UserProfileState> _mapUserProfileUpdatedToState(
      UserProfileUpdated event) async* {
    yield UserProfileLoaded(event.userProfile);
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
