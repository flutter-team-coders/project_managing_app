import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:project_managment_system/view/Sign_up.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(Loading());

      Response response = await Dio().get(
          "https://projects-management-system.onrender.com/api/v1/auth/register",
          data: event.user.toMap());
      if (response.statusCode == 200) {
        emit(Success());
      } else {
        emit(Error());
      }
    });
  }
}
