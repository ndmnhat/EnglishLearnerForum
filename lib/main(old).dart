import 'package:EnglishLearnerForum/blocs/authBloc/auth_bloc.dart';
import 'package:EnglishLearnerForum/blocs/authBloc/auth_state.dart';
import 'package:EnglishLearnerForum/repositories/user_repository.dart';
import 'package:EnglishLearnerForum/ui/pages/home_page(old).dart';
import 'package:EnglishLearnerForum/ui/pages/login_page(old).dart';
import 'package:EnglishLearnerForum/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/authBloc/auth_event.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meta/meta.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) =>
            AuthBloc(userRepository: userRepository)..add(AppStartedEvent()),
        child: App(
          userRepository: userRepository,
        ),
      ),
    );
  }
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({@required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitialState) {
          return SplashPage();
        } else if (state is AuthenticatedState) {
          return HomePageParent(
              user: state.user, userRepository: userRepository);
        } else if (state is UnauthenticatedState) {
          return LoginPageParent(userRepository: userRepository);
        } else
          return LoginPageParent(userRepository: userRepository);
      },
    );
  }
}
