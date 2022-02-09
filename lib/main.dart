import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_apaga/blocs/login_bloc/login_bloc.dart';
import 'package:smart_apaga/repositroy/user_repostory.dart';

import 'ui/screens/login_screen/login.dart';

void main() {
  runApp(MyApp(
    userRepository: UserRepository(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, @required this.userRepository}) : super(key: key);
  final UserRepository userRepository;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(userRepository),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
