import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_managing_system/main.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;

  LoginBloc({required this.userRepository}) : super(LoginInitial()) {
    on<Login>(_onLogin);
  }

  void _onLogin(Login event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final token = await userRepository.authenticate(
        email: event.email,
        password: event.password,
      );
      emit(LoginSuccess(token));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
