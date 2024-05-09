part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {
  get user => null;
}

class SignUp extends LoginEvent {
  @override
  final SignUpInfo user;

  SignUp({required this.user});
}
