import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';

class SignupInfo {
  final Dio dio = Dio();

  Future<String> register(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    try {
      final response = await dio.post(
          'https://projects-management-system.onrender.com/api/v1/auth/register',
          data: {
            'firstName': firstName,
            'lastName': lastName,
            'email': email,
            'password': password,
          });
      print(response.data['access_token']);
      return response.data['access_token'];
    } catch (e) {
      throw Exception('Failed to register: $e');
    }
  }
}

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUp>(_onSignUp);
  }

  void _onSignUp(SignUp event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());
    try {
      String token = await SignupInfo().register(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        password: event.password,
      );
      var store = await SharedPreferences.getInstance();
      store.setString('authToken', token);
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpFailure(e.toString()));
    }
  }
}
