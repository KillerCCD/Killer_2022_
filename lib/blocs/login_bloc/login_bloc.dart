import 'package:bloc/bloc.dart';
import 'package:smart_apaga/blocs/login_bloc/login_event.dart';
import 'package:smart_apaga/blocs/login_bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initialState) : super(initialState);
}
