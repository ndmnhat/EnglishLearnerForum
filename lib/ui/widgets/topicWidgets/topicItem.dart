import 'package:EnglishLearnerForum/repositories/repository.dart';
import 'package:EnglishLearnerForum/ui/pages/topic_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:EnglishLearnerForum/blocs/topicBloc/topic.dart';
import 'package:EnglishLearnerForum/model/topic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:meta/meta.dart';

class TopicItem extends StatelessWidget {
  final Topic topic;
  final User user;
  TopicItem({this.topic, this.user});
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key("__topicItem__"),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: InkWell(
            child: Card(
              child: ListTile(
                leading: Icon(Icons.forum,
                    size: 60, color: Theme.of(context).accentColor),
                title: Text(topic.title ?? ""),
                subtitle: Text(topic.description ?? ""),
                isThreeLine: true,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return TopicPageParent(
                      topic: topic,
                      user: user,
                      postRepository: PostRepository(topic),
                    );
                  },
                ),
              );
            }),
      ),
      background: slideRightBackground(),
      secondaryBackground: slideLeftBackground(),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          _showDialog(
            context,
            title: "Xác nhận xoá",
            content: "Bạn có muốn xoá?",
            onCancel: () {},
            onConfirm: () {
              BlocProvider.of<TopicBloc>(context).add(DeleteTopic(topic));
              Navigator.of(context).pop(true);
            },
          );
        } else if (direction == DismissDirection.startToEnd) {
          _showUpdateForm(context, topic: topic);
        }
        return false;
      },
    );
  }

  Future<bool> _showDialog(BuildContext context,
      {String title,
      String content,
      Function onCancel,
      Function onConfirm}) async {
    return showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          FlatButton(
            child: Text("Huỷ bỏ"),
            onPressed: () {
              onCancel();
              Navigator.of(context).pop(false);
            },
          ),
          FlatButton(
            child: Text("Xác nhận"),
            onPressed: () {
              onConfirm();
            },
          ),
        ],
      ),
    );
  }

  Future<bool> _showUpdateForm(BuildContext context, {Topic topic}) async {
    TextEditingController _titlecontroller =
        new TextEditingController(text: topic.title);
    TextEditingController _descriptioncontroller =
        new TextEditingController(text: topic.description);

    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            scrollable: true,
            title: Text('Chủ đề'),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Tên chủ đề',
                      ),
                      controller: _titlecontroller,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Mô tả',
                      ),
                      controller: _descriptioncontroller,
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
                  child: Text("Lưu"),
                  onPressed: () {
                    topic.title = _titlecontroller.text;
                    topic.description = _descriptioncontroller.text;
                    BlocProvider.of<TopicBloc>(context).add(UpdateTopic(topic));
                    Navigator.of(context).pop(true);
                  })
            ],
          );
        });
  }
}

Widget slideRightBackground() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
    child: Container(
      color: Colors.yellow,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
            Text(
              " Sửa",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    ),
  );
}

Widget slideLeftBackground() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
    child: Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              "Xoá",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    ),
  );
}
