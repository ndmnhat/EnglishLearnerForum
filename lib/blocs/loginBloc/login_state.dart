import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginState extends Equatable {}

class LoginInitialState extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LoginLoadingState extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LoginSuccessState extends LoginState {
  final User user;

  LoginSuccessState(this.user);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LoginFailState extends LoginState {
  final String message;

  LoginFailState(this.message);

  @override
  // TODO: implement props
  List<Object> get props => null;
}
