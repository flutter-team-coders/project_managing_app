import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginInfo {
  final Dio dio = Dio();

  Future<String> authenticate(
      {required String email, required String password}) async {
    try {
      final response = await dio.post(
          'https://projects-management-system.onrender.com/api/v1/auth/login',
          data: {
            'email': email,
            'password': password,
          });
      print(response);
      return response.data['access_token'];
    } catch (e) {
      throw Exception('Failed to authenticate: $e');
    }
  }
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<Login>(_onLogin);
  }

  void _onLogin(event, emit) async {
    emit(LoginLoading());
    try {
      final token = await LoginInfo().authenticate(
        email: event.email,
        password: event.password,
      );
      emit(LoginSuccess(token));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
