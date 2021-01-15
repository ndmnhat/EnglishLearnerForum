//import 'dart:html';

//import 'package:Giaodien/home.dart';
import 'package:Giaodien/home.dart';
import 'package:Giaodien/bottombar.dart';
import 'package:flutter/material.dart';

//import 'home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false, home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

// class _LoginPageState extends StatefulWidget{
//    LoginPageState({Key key, this.title}) : super(key: key);
// }

class _LoginPageState extends State<LoginPage> {
  bool _showPass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Stack(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 80),
                  child: new Container(
                    height: 200.0,
                    width: 400.0,
                    decoration: new BoxDecoration(
                      color: Colors.cyanAccent[400],
                      borderRadius: new BorderRadius.circular(60.0),
                    ),
                  ),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: new Text(
                        "Ứng dụng chia sẻ\n tài liệu và kinh\n nghiệm luyện thi\n Tiếng Anh",
                        style: new TextStyle(fontSize: 30.0,fontStyle: FontStyle.italic,),
                      ),
                    ),
                  ],
                ),
              ]),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                child: TextField(
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      labelText: "TÀI KHOẢN",
                      labelStyle:
                          TextStyle(color: Color(0xff888888), fontSize: 16),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    TextField(
                        keyboardType: TextInputType.number,
                        obscureText: !_showPass,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          labelText: "MẬT KHẨU",
                          labelStyle:
                              TextStyle(color: Color(0xff888888), fontSize: 16),
                        )),
                    GestureDetector(
                        onTap: onTonggleShowhide,
                        child: Text(
                          _showPass ? "HIDE" : "SHOW",
                          style: TextStyle(
                              color: Colors.cyanAccent[400],
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    onPressed: onSigninClick,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    color: Colors.cyanAccent[400],
                    child: Text("SIGN IN"),
                  ),
                ),
              ),
              //Padding(
              //padding: const EdgeInsets.fromLTRB(0,0,0,20),
              Container(
                height: 50,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Chưa có tài khoản? Đăng ký",
                      style: TextStyle(color: Color(0xff888888)),
                    ),
                    Text(
                      "Quên mật khẩu?",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ],
                ),
              ),
              //)
            ],
          ),
        ),
      ),
    );
  }

  void onSigninClick() {
    Navigator.push(context, MaterialPageRoute(builder: gotoHome));
  }

  void onTonggleShowhide() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  Widget gotoHome(BuildContext context) {
    return BottomBar();
  }
}
