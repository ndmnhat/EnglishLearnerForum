import 'package:EnglishLearnerForum/blocs/userProfileBloc/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
        builder: (context, state) {
      if (state is UserProfileLoaded)
        return CircleAvatar(
          backgroundColor: Colors.cyanAccent,
          backgroundImage: state.userProfile.avatarURL != null
              ? NetworkImage(state.userProfile.avatarURL)
              : AssetImage('assets/avatar.png'),
        );
      else
        return CircleAvatar(
          backgroundColor: Colors.cyanAccent[400],
          child: Icon(Icons.person, color: Colors.white),
        );
    });
  }
}
