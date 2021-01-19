import 'package:EnglishLearnerForum/model/topic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:EnglishLearnerForum/blocs/bloc.dart';
import 'package:EnglishLearnerForum/model/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class AddPostButton extends StatelessWidget {
  final User user;
  final Topic topic;
  const AddPostButton({Key key, this.user, this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        _showAddForm(context);
      },
      elevation: 2.0,
      fillColor: Colors.white,
      child: Icon(
        Icons.add,
        size: 35.0,
      ),
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(),
    );
  }

  Future<bool> _showAddForm(BuildContext context) async {
    TextEditingController _titlecontroller = new TextEditingController();
    TextEditingController _contentcontroller = new TextEditingController();

    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            scrollable: true,
            title: Text('Bài viết'),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Tên bài viết',
                      ),
                      controller: _titlecontroller,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nội dung',
                      ),
                      controller: _contentcontroller,
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              RaisedButton(
                child: Text("Huỷ bỏ"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              RaisedButton(
                  child: Text("Thêm"),
                  onPressed: () {
                    Post post = new Post(
                      userRef: user.uid,
                      topic_id: topic.id,
                      title: _titlecontroller.text,
                      content: _contentcontroller.text,
                      state: "Pending",
                    );
                    BlocProvider.of<PostBloc>(context).add(AddPost(post));
                    Navigator.of(context).pop(true);
                  })
            ],
          );
        });
  }
}
