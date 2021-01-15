import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
            CircleAvatar(
              backgroundColor: Colors.cyanAccent,
              radius: 50,
            ),
            Text(
              "Username",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Text(
                "Họ tên: Username",
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
                "Email: xx52xxxx@gm.uit.edu.vn",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Divider(color: Colors.black),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: SizedBox(
                width: 200,
                height: 50,
                child: RaisedButton(
                  onPressed: onDoiMatKhauClick,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  color: Colors.cyanAccent[400],
                  child: Text("Đổi mật khẩu"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDoiMatKhauClick() {}
}
