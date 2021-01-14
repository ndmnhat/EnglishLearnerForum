import 'package:EnglishLearnerForum/blocs/authBloc/auth_event.dart';
import 'package:EnglishLearnerForum/blocs/authBloc/auth_state.dart';
import 'package:EnglishLearnerForum/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserRepository userRepository;

  AuthBloc({@required UserRepository userRepository})
      : super(AuthInitialState()) {
    this.userRepository = userRepository;
  }

  // @override
  // // TODO: implement initialState
  // AuthState get initialState => AuthInitialState();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStartedEvent) {
      try {
        var isSignedIn = await userRepository.isSignedIn();
        if (isSignedIn) {
          var user = await userRepository.getCurrentUser();
          yield AuthenticatedState(user);
        } else {
          yield UnauthenticatedState();
        }
      } catch (e) {
        yield UnauthenticatedState();
      }
    }
  }
}
