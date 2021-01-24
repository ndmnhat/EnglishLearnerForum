import 'dart:io';

import 'package:EnglishLearnerForum/blocs/userProfileBloc/userProfile.dart';
import 'package:EnglishLearnerForum/blocs/userProfileBloc/userProfile_bloc.dart';
import 'package:EnglishLearnerForum/blocs/userProfileBloc/userProfile_event.dart';
import 'package:EnglishLearnerForum/model/userProfile.dart';
import 'package:EnglishLearnerForum/repositories/repository.dart';
import 'package:EnglishLearnerForum/ui/widgets/accountWidgets/UserProfileDisplay.dart';
import 'package:EnglishLearnerForum/ui/widgets/accountWidgets/UserProfileEdit.dart';
import 'package:EnglishLearnerForum/ui/widgets/accountWidgets/editAvatarButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AccountPageParent extends StatelessWidget {
  final User user;
  final UserRepository userRepository;

  const AccountPageParent({Key key, this.userRepository, this.user})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserProfileBloc(userProfileRepository: userRepository)
            ..add(LoadUserProfile(user.uid)),
      child: AccountPage(userRepository: userRepository),
    );
  }
}

class AccountPage extends StatefulWidget {
  final UserRepository userRepository;

  const AccountPage({Key key, this.userRepository}) : super(key: key);
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool _isEditing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tài khoản"),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent[400],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            BlocBuilder<UserProfileBloc, UserProfileState>(
              builder: (context, state) {
                if (state is UserProfileLoading)
                  return CircularProgressIndicator();
                else if (state is UserProfileLoaded) {
                  if (_isEditing == false)
                    return UserProfileDisplay(userProfile: state.userProfile);
                  else
                    return UserProfileEdit(
                        userProfile: state.userProfile,
                        setEditingValue: () {
                          setState(() {
                            _isEditing = false;
                          });
                        });
                }
                return Container();
              },
            ),
            Visibility(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    onPressed: onSuaThongTinClick,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    color: Colors.cyanAccent[400],
                    child: Text("Sửa thông tin"),
                  ),
                ),
              ),
              visible: !_isEditing,
            ),
          ],
        ),
      ),
    );
  }

  void onSuaThongTinClick() {
    setState(() {
      _isEditing = true;
    });
  }
}
