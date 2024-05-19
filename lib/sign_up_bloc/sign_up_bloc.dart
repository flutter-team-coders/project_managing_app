import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_managing_system/main.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository userRepository;

  SignUpBloc({required this.userRepository}) : super(SignUpInitial()) {
    on<SignUp>(_onSignUp);
  }

  void _onSignUp(SignUp event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());
    try {
      await userRepository.register(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        password: event.password,
      );
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpFailure(e.toString()));
    }
  }
}
