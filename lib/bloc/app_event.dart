part of 'app_bloc.dart';

@immutable
sealed class AppEvent {}

class LoggedIn extends AppEvent {}

class Second extends AppEvent {}

class SignedUp extends AppEvent {}
