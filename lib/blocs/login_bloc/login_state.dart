import 'package:equatable/equatable.dart';

enum LoginStatus { inital, loading, success, failure }

extension LoginStatusX on LoginStatus {
  bool get isLoginLoading => this == LoginStatus.loading;
  bool get isLoginSuccess => this == LoginStatus.success;
  bool get isLoginFailure => this == LoginStatus.failure;
}

class LoginState extends Equatable {
  final String email;
  final String password;
  final bool status;
  const LoginState({
    this.email,
    this.password,
    this.status,
  });

  LoginState copyWith({
    String email,
    String password,
    bool status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  String toString() => 'LoginState(username: $email, password: $password)';

  @override
  List<Object> get props => [email, password];
}
// import 'package:equatable/equatable.dart';
// import 'package:formz/formz.dart';
// import 'package:smart_apaga/repositroy/models/email.dart';
// import 'package:smart_apaga/repositroy/models/password.dart';

// class LoginState extends Equatable {
//   const LoginState({
//     this.status = FormzStatus.pure,
//     this.username = const Email.pure(),
//     this.password = const Password.pure(),
//   });

//   final FormzStatus status;
//   final Email username;
//   final Password password;

//   LoginState copyWith({
//     FormzStatus status,
//     Email username,
//     Password password,
//   }) {
//     return LoginState(
//       status: status ?? this.status,
//       username: username ?? this.username,
//       password: password ?? this.password,
//     );
//   }

//   @override
//   List<Object> get props => [status, username, password];
// }
