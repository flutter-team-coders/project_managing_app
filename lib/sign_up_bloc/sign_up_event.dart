abstract class SignUpEvent {}

class SignUp extends SignUpEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  SignUp({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
}
