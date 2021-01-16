import 'package:EnglishLearnerForum/blocs/bloc.dart';
import 'package:EnglishLearnerForum/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:EnglishLearnerForum/ui/pages/page_parent.dart';
import 'package:EnglishLearnerForum/ui/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class SignUpPageParent extends StatelessWidget {
  final UserRepository userRepository;

  SignUpPageParent({@required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserRegBloc(userRepository: userRepository),
      child: SignUpPage(userRepository: userRepository),
    );
  }
}

//ignore: must_be_immutable
class SignUpPage extends StatelessWidget {
  TextEditingController emailCntrl = TextEditingController();
  TextEditingController passCntrlr = TextEditingController();

  String authResult;
  UserRegBloc userRegBloc;
  UserRepository userRepository;

  SignUpPage({@required this.userRepository});

  @override
  Widget build(BuildContext context) {
    userRegBloc = BlocProvider.of<UserRegBloc>(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5.0),
                child: BlocListener<UserRegBloc, UserRegState>(
                  listener: (context, state) {
                    if (state is UserRegSuccessful) {
                      navigateToHomePage(context, state.user);
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
                        emailCntrl.text = "";
                        passCntrlr.text = "";
                      }
                      return Container();
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                child: TextField(
                  controller: emailCntrl,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: "E-mail",
                    hintText: "E-mail",
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                child: TextField(
                  controller: passCntrlr,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    hintText: "Password",
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: RaisedButton(
                      color: Colors.cyan,
                      child: Text("Sign Up"),
                      textColor: Colors.white,
                      onPressed: () {
                        userRegBloc.add(SignUpButtonPressed(
                            email: emailCntrl.text, password: passCntrlr.text));
                      },
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      color: Colors.cyan,
                      child: Text("Login Now"),
                      textColor: Colors.white,
                      onPressed: () {
                        navigateToLoginPage(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInitialUi() {
    return Text("Waiting For Authentication");
  }

  Widget buildLoadingUi() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  void navigateToHomePage(BuildContext context, User user) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PageParent(user: user, userRepository: userRepository);
    }));
  }

  Widget buildFailureUi(String message) {
    return Text(
      message,
      style: TextStyle(color: Colors.red),
    );
  }

  void navigateToLoginPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoginPageParent(userRepository: userRepository);
    }));
  }
}
