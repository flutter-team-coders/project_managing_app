import 'dart:convert';

class LoginInfo {
  String email;
  String password;
  LoginInfo({
    required this.email,
    required this.password,
  });

  LoginInfo copyWith({
    String? email,
    String? password,
  }) {
    return LoginInfo(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginInfo.fromMap(Map<String, dynamic> map) {
    return LoginInfo(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginInfo.fromJson(String source) =>
      LoginInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginInfo(email: $email, password: $password)';

  @override
  bool operator ==(covariant LoginInfo other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}

class SignUpInfo {
  String firstname;
  String lastname;
  String email;
  String password;
  String role;

  SignUpInfo({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    this.role = "USER",
  });

  SignUpInfo copyWith({
    String? firstname,
    String? lastname,
    String? email,
    String? password,
    String? role,
  }) {
    return SignUpInfo(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'password': password,
      'role': role,
    };
  }

  factory SignUpInfo.fromMap(Map<String, dynamic> map) {
    return SignUpInfo(
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpInfo.fromJson(String source) =>
      SignUpInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SignUpInfo(firstname: $firstname, lastname: $lastname, email: $email, password: $password, role: $role)';
  }

  @override
  bool operator ==(covariant SignUpInfo other) {
    if (identical(this, other)) return true;

    return other.firstname == firstname &&
        other.lastname == lastname &&
        other.email == email &&
        other.password == password &&
        other.role == role;
  }

  @override
  int get hashCode {
    return firstname.hashCode ^
        lastname.hashCode ^
        email.hashCode ^
        password.hashCode ^
        role.hashCode;
  }
}
