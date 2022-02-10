import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_apaga/blocs/login_bloc/login_bloc.dart';
import 'package:smart_apaga/blocs/login_bloc/login_event.dart';
import 'package:smart_apaga/blocs/login_bloc/login_state.dart';
import 'package:smart_apaga/ui/widgets/text_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          //showLoadingDialog(context);
          print('loading');
        }

        if (state is LoginFailure) {
          // showErrorDialog(context);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
          print('failure');
        }
        if (state is LoginSuccess) {
          //showSuccessDialog(context);
          print('succes');
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _emailField(),
            const SizedBox(height: 20.0),
            _passwordField(),
            Align(
              alignment: Alignment.centerRight,
              child: TextButtonForAll(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 0.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                text: const Text(
                  'Forgot password',
                  style: TextStyle(fontSize: 12.0, color: Colors.green),
                ),
                onPressed: () {
                  print('object');
                },
              ),
            ),
            TextButtonForAll(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              width: double.infinity,
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                primary: Colors.blue,
                onSurface: Colors.red,
                backgroundColor: Colors.green.shade300,
              ),
              onPressed: () {
                context.read<LoginBloc>().add(LoginSubmitted(
                    email: _emailController.text,
                    password: _passwordController.text));
              },
              text: const Text(
                'Login',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emailField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 5.0,
        ),
        child: TextFormField(
          controller: _emailController,
          validator: (value) {
            if (value == null || value.isEmpty || state.email.isEmpty) {
              const Text('asdfasdf');
            }
            return null;
          },
          onChanged: (email) =>
              context.read<LoginBloc>().add(LoginEmailChanged(email: email)),
          decoration: InputDecoration(
            //border: OutlineInputBorder(),
            labelStyle: const TextStyle(color: Colors.grey),
            labelText: 'email text',
            // errorText: !state.isEmailValid ? 'Invalid Email' : null,
            hintStyle: TextStyle(color: Colors.grey[500], fontSize: 13),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green[700]),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          autocorrect: false,
        ),
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 0.0,
        ),
        child: TextFormField(
          controller: _passwordController,
          // validator: (value) {
          //   if (value == null || value.isEmpty || !state.isPasswordValid) {
          //     buildAppBar(context, value);
          //     return AppLocalizations.of(context).passwordErrorText;
          //   }
          //   return null;
          // },
          onChanged: (password) => context
              .read<LoginBloc>()
              .add(LoginPasswordChanged(password: password)),
          decoration: InputDecoration(
            //border: OutlineInputBorder(),
            labelStyle: const TextStyle(color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green[700]),
            ),
            labelText: 'password',
            // errorText: !state.isPasswordValid
            //     ? AppLocalizations.of(context).passwordErrorText
            //     : null,
          ),
          obscureText: true,
          autocorrect: false,
        ),
      );
    });
  }
}
