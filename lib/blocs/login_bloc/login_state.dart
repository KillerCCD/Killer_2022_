import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  const LoginState({
    @required this.email,
    @required this.password,
  });

  LoginState copyWith({
    String email,
    String password,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  String toString() => 'LoginState(username: $email, password: $password)';

  @override
  List<Object> get props => [email, password];
}

class LoginInital extends LoginState {
  const LoginInital();
}

class LoginSuccess extends LoginState {
  const LoginSuccess();
}

class LoginFailure extends LoginState {
  const LoginFailure();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}
