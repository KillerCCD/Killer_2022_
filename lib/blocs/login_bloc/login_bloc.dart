import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:smart_apaga/blocs/login_bloc/login_event.dart';
import 'package:smart_apaga/blocs/login_bloc/login_state.dart';
import 'package:smart_apaga/repositroy/user_repostory.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;
  LoginBloc(this._userRepository) : super(const LoginInital()) {
    on<LoginEmailChanged>(_onLoginEmailChanged);
    on<LoginPasswordChanged>(_onLoginPasswordChanged);
    on<LoginSubmitted>(_onLoginSumbitted);
  }

  FutureOr<void> _onLoginEmailChanged(
      LoginEmailChanged event, Emitter<LoginState> emit) {
    final email = event.email;
    print("state email: ${state.email} ");
    emit(state.copyWith(email: email));
  }

  FutureOr<void> _onLoginPasswordChanged(
      LoginPasswordChanged event, Emitter<LoginState> emit) {
    final password = event.password;
    print("state passowrd: ${state.password} ");
    emit(state.copyWith(password: password));
  }

  FutureOr<void> _onLoginSumbitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(const LoginLoading());
    emit(state.copyWith(email: 'state.email', password: " state.password"));
    Map userMap = {'email': state.email, 'password': state.password};

    print('UserMap: $userMap');

    try {
      bool isTrue = await _userRepository.loginUser(userMap);
      if (isTrue) {
        emit(const LoginSuccess());
      } else {
        emit(const LoginFailure());
      }
    } catch (e) {
      emit(const LoginFailure());
    }
  }
}
