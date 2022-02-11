import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:smart_apaga/blocs/login_bloc/login_event.dart';
import 'package:smart_apaga/blocs/login_bloc/login_state.dart';
import 'package:smart_apaga/repositroy/user_repostory.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;
  LoginBloc(this._userRepository) : super(const LoginState()) {
    on<LoginEmailChanged>(_onLoginEmailChanged);
    on<LoginPasswordChanged>(_onLoginPasswordChanged);
    on<LoginSubmitted>(_onLoginSumbitted);
  }

  FutureOr<void> _onLoginEmailChanged(
      LoginEmailChanged event, Emitter<LoginState> emit) {
    final email = event.email;

    emit(state.copyWith(email: email));
  }

  FutureOr<void> _onLoginPasswordChanged(
      LoginPasswordChanged event, Emitter<LoginState> emit) {
    final password = event.password;
    emit(state.copyWith(password: password));
  }

  FutureOr<void> _onLoginSumbitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: true));

    Map userMap = {'email': state.email, 'password': state.password};

    print('UserMap: $userMap');

    try {
      bool isTrue = await _userRepository.loginUser(userMap);
      if (isTrue) {
        emit(state.copyWith(status: true));
      } else {
        emit(state.copyWith(status: false));
      }
    } catch (e) {
      emit(state.copyWith(status: false));
    }
  }
}

// import 'package:bloc/bloc.dart';
// import 'package:formz/formz.dart';
// import 'package:smart_apaga/repositroy/models/email.dart';
// import 'package:smart_apaga/repositroy/models/password.dart';
// import 'package:smart_apaga/repositroy/user_repostory.dart';

// import 'login_event.dart';
// import 'login_state.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final UserRepository userRepository;
//   LoginBloc(this.userRepository) : super(const LoginState()) {
//     on<LoginEmailChanged>(_onUsernameChanged);
//     on<LoginPasswordChanged>(_onPasswordChanged);
//     on<LoginSubmitted>(_onSubmitted);
//   }

//   void _onUsernameChanged(
//     LoginEmailChanged event,
//     Emitter<LoginState> emit,
//   ) {
//     final username = Email.dirty(event.email);
//     emit(state.copyWith(
//       username: username,
//       status: Formz.validate([state.password, username]),
//     ));
//   }

//   void _onPasswordChanged(
//     LoginPasswordChanged event,
//     Emitter<LoginState> emit,
//   ) {
//     final password = Password.dirty(event.password);
//     emit(state.copyWith(
//       password: password,
//       status: Formz.validate([password, state.username]),
//     ));
//   }

//   void _onSubmitted(
//     LoginSubmitted event,
//     Emitter<LoginState> emit,
//   ) async {
//     emit(state.copyWith(status: FormzStatus.submissionInProgress));
//     Map userMap = {
//       'email': state.username.value,
//       'password': state.password.value
//     };
//     try {
//       bool isTrue = await userRepository.loginUser(userMap);
//       if (isTrue) {
//         emit(state.copyWith(status: FormzStatus.submissionSuccess));
//       } else {
//         emit(state.copyWith(status: FormzStatus.submissionFailure));
//       }
//     } catch (_) {
//       emit(state.copyWith(status: FormzStatus.submissionFailure));
//     }
//   }
// }
