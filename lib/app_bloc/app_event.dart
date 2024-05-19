part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class LoggedIn extends AppEvent {}

class NavigateToMainPage extends AppEvent {}

class SignedUp extends AppEvent {}
