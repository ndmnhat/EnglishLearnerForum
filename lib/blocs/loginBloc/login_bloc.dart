import 'package:EnglishLearnerForum/blocs/loginBloc/login_event.dart';
import 'package:EnglishLearnerForum/blocs/loginBloc/login_state.dart';
import 'package:EnglishLearnerForum/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

export 'package:EnglishLearnerForum/blocs/loginBloc/login_event.dart';
export 'package:EnglishLearnerForum/blocs/loginBloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository userRepository;

  LoginBloc({@required UserRepository userRepository})
      : super(LoginInitialState()) {
    this.userRepository = userRepository;
  }

  // @override
  // // TODO: implement initialState
  // LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoadingState();
      try {
        var user = await userRepository.signInEmailAndPassword(
            event.email, event.password);
        yield LoginSuccessState(user);
      } catch (e) {
        yield LoginFailState(e.toString());
      }
    }
  }
}
