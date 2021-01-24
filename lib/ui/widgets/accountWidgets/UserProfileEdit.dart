import 'dart:io';

import 'package:EnglishLearnerForum/blocs/userProfileBloc/userProfile.dart';
import 'package:EnglishLearnerForum/model/userProfile.dart';
import 'package:EnglishLearnerForum/ui/widgets/accountWidgets/editAvatarButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileEdit extends StatelessWidget {
  final UserProfile userProfile;
  final Function setEditingValue;
  TextEditingController _displayNameController;
  TextEditingController _phoneController;

  UserProfileEdit({Key key, this.userProfile, this.setEditingValue})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    _displayNameController =
        new TextEditingController(text: userProfile.displayName);
    _phoneController = new TextEditingController(text: userProfile.phoneNumber);
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.cyanAccent,
                  radius: 50,
                  backgroundImage: userProfile.avatarURL != null
                      ? NetworkImage(userProfile.avatarURL)
                      : AssetImage('assets/avatar.png'),
                ),
                EditAvatarButton(
                  onPressed: () async {
                    File _image;
                    var picker = ImagePicker();
                    var pickedFile =
                        await picker.getImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      _image = File(pickedFile.path);
                      BlocProvider.of<UserProfileBloc>(context)
                          .add(UpdateUserAvatar(_image));
                      // Scaffold.of(context).showSnackBar(
                      //     SnackBar(content: Text("Đã cập nhật ảnh đại diện")));
                    }
                  },
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    TextFormField(
                        decoration: InputDecoration(
                          labelText: "Tên hiển thị",
                          labelStyle:
                              TextStyle(color: Color(0xff888888), fontSize: 16),
                        ),
                        controller: _displayNameController),
                    TextFormField(
                        decoration: InputDecoration(
                          labelText: "Số điện thoại",
                          labelStyle:
                              TextStyle(color: Color(0xff888888), fontSize: 16),
                        ),
                        controller: _phoneController)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: SizedBox(
                width: 200,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    userProfile.displayName = _displayNameController.text;
                    userProfile.phoneNumber = _phoneController.text;
                    BlocProvider.of<UserProfileBloc>(context)
                        .add(UpdateUserProfile(userProfile));
                    setEditingValue();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  color: Colors.cyanAccent[400],
                  child: Text("Cập nhật"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
