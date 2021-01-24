import 'dart:io';

import 'package:EnglishLearnerForum/blocs/userProfileBloc/userProfile.dart';
import 'package:EnglishLearnerForum/model/userProfile.dart';
import 'package:EnglishLearnerForum/ui/widgets/accountWidgets/editAvatarButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileDisplay extends StatelessWidget {
  final UserProfile userProfile;

  const UserProfileDisplay({Key key, this.userProfile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
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
          Text(
            userProfile.displayName ?? "Unknown",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Text(
              "Số điện thoại: " + (userProfile.phoneNumber ?? "Unknown"),
              style: TextStyle(fontSize: 20),
            ),
          ),
          Divider(color: Colors.black),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Text(
              "Ngày sinh: 01/01/2021",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Divider(color: Colors.black),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Text(
              "Email: " + (userProfile.email ?? "Unknown"),
              style: TextStyle(fontSize: 20),
            ),
          ),
          Divider(color: Colors.black),
        ],
      ),
    );
  }
}
