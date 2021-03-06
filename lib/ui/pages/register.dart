import 'package:EnglishLearnerForum/blocs/bloc.dart';
import 'package:EnglishLearnerForum/repositories/user_repository.dart';
import 'package:EnglishLearnerForum/ui/pages/login.dart';
import 'package:EnglishLearnerForum/ui/pages/page_parent.dart';
import 'package:EnglishLearnerForum/ui/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class RegPageParent extends StatelessWidget {
  final UserRepository userRepository;

  RegPageParent({@required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserRegBloc(userRepository: userRepository),
      child: RegPage(userRepository: userRepository),
    );
  }
}

class RegPage extends StatefulWidget {
  final UserRepository userRepository;
  RegPage({Key key, this.userRepository}) : super(key: key);

  @override
  _RegPageState createState() => _RegPageState();
}

// class _RegPageState extends StatefulWidget{
//    RegPageState({Key key, this.title}) : super(key: key);
// }

class _RegPageState extends State<RegPage> {
  TextEditingController emailCntrlr = TextEditingController();
  TextEditingController passCntrlr = TextEditingController();
  bool _showPass = false;
  UserRegBloc regBloc;
  @override
  Widget build(BuildContext context) {
    regBloc = BlocProvider.of<UserRegBloc>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: <Widget>[
          Center(
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
                            style: new TextStyle(
                              fontSize: 30.0,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                    child: TextField(
                      controller: emailCntrlr,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        labelText: "EMAIL",
                        labelStyle:
                            TextStyle(color: Color(0xff888888), fontSize: 16),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
                    child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: <Widget>[
                        TextField(
                          controller: passCntrlr,
                          obscureText: !_showPass,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            labelText: "MẬT KHẨU",
                            labelStyle: TextStyle(
                                color: Color(0xff888888), fontSize: 16),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                        ),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        color: Colors.cyanAccent[400],
                        child: Text("ĐĂNG KÝ"),
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
                        InkWell(
                          child: Text(
                            "Đã có tài khoản? Đăng nhập",
                            style: TextStyle(color: Color(0xff888888)),
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => LoginPageParent(
                                          userRepository: widget.userRepository,
                                        )));
                          },
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
          Container(
            padding: EdgeInsets.all(5.0),
            child: BlocListener<UserRegBloc, UserRegState>(
              listener: (context, state) {
                if (state is UserRegSuccessful) {
                  navigateToHomeScreen(context, state.user);
                }
              },
              child: BlocBuilder<UserRegBloc, UserRegState>(
                builder: (context, state) {
                  if (state is UserRegInitial) {
                    return buildInitialUi();
                  } else if (state is UserRegLoading) {
                    return buildLoadingUi();
                  } else if (state is UserRegFailure) {
                    return buildFailureUi(state.message);
                  } else if (state is UserRegSuccessful) {
                    emailCntrlr.text = "";
                    passCntrlr.text = "";
                  }
                  return Container();
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void onSigninClick() {
    regBloc.add(
      SignUpButtonPressed(
        email: emailCntrlr.text,
        password: passCntrlr.text,
      ),
    );
  }

  void onTonggleShowhide() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  // Widget gotoHome(BuildContext context) {
  //   return BottomBar();
  // }

  Widget buildInitialUi() {
    return Container();
  }

  Widget buildLoadingUi() {
    return Container(
      color: Colors.black.withOpacity(0.2),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget buildFailureUi(String message) {
    return Center(
        child: Container(
      padding: EdgeInsets.all(5.0),
      child: Text(
        "Fail $message",
        style: TextStyle(color: Colors.red),
      ),
    ));
  }

  void navigateToHomeScreen(BuildContext context, User user) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return PageParent(user: user, userRepository: widget.userRepository);
    }));
  }
}
