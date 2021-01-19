import 'package:flutter/material.dart';
import 'package:EnglishLearnerForum/blocs/topicBloc/topic.dart';
import 'package:EnglishLearnerForum/model/topic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class AddTopicButton extends StatelessWidget {
  const AddTopicButton({Key key}) : super(key: key);

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
    TextEditingController _descriptioncontroller = new TextEditingController();

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
                  child: Text("Thêm"),
                  onPressed: () {
                    Topic topic = new Topic(
                      title: _titlecontroller.text,
                      description: _descriptioncontroller.text,
                    );
                    topic.title = _titlecontroller.text;
                    topic.description = _descriptioncontroller.text;
                    BlocProvider.of<TopicBloc>(context).add(AddTopic(topic));
                    Navigator.of(context).pop(true);
                  })
            ],
          );
        });
  }
}
