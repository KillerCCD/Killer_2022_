import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class LoginEmailChanged extends LoginEvent {
  final String email;

  const LoginEmailChanged({this.email});

  @override
  List<Object> get props => [email];
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  const LoginPasswordChanged({this.password});

  @override
  List<Object> get props => [password];
}

class LoginSubmitted extends LoginEvent {
  // final String email;
  // final String password;
  const LoginSubmitted();
  // @override
  // List<Object> get props => [email, password];
  // @override
  // String toString() {
  //   return 'email:$email ^^ password:$password';
  // }
}
