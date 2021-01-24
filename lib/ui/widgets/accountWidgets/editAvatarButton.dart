import 'package:flutter/material.dart';

class EditAvatarButton extends StatelessWidget {
  final Function onPressed;

  const EditAvatarButton({Key key, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 30,
      height: 40,
      child: RaisedButton(
        shape: CircleBorder(),
        onPressed: onPressed,
        color: Colors.yellow[300],
        child: Icon(Icons.edit),
      ),
    );
  }
}
