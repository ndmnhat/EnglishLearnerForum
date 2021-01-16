import 'package:EnglishLearnerForum/blocs/regBloc/user_reg_event.dart';
import 'package:EnglishLearnerForum/blocs/regBloc/user_reg_state.dart';
import 'package:EnglishLearnerForum/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

export 'package:EnglishLearnerForum/blocs/regBloc/user_reg_event.dart';
export 'package:EnglishLearnerForum/blocs/regBloc/user_reg_state.dart';

class UserRegBloc extends Bloc<UserRegEvent, UserRegState> {
  UserRepository userRepository;

  UserRegBloc({@required UserRepository userRepository})
      : super(UserRegInitial()) {
    this.userRepository = userRepository;
  }

  // @override
  // // TODO: implement initialState
  // UserRegState get initialState => UserRegInitial();

  @override
  Stream<UserRegState> mapEventToState(UserRegEvent event) async* {
    if (event is SignUpButtonPressed) {
      yield UserRegLoading();
      try {
        var user = await userRepository.signUpUserWithEmailPass(
            event.email, event.password);
        print("BLoC : ${user.email}");
        yield UserRegSuccessful(user);
      } catch (e) {
        yield UserRegFailure(e.toString());
      }
    }
  }
}
