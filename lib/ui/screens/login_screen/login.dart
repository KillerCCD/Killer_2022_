import 'package:flutter/material.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            flex: 4,
                            child: Text(
                              'Welcome',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.lightGreen, fontSize: 18),
                            ),
                          ),

                          // SizedBox(
                          //   width: 35,
                          // ),
                          // Container(
                          //   width: 40,
                          //   //height: 50,
                          //   alignment:
                          //       AlignmentDirectional(-0.050000000000000044, 0),
                          //   child: DropdownButtonHideUnderline(
                          //     child: DropdownButton(
                          //       //isExpanded: true,
                          //       value: locale,
                          //       icon: Container(width: 5),
                          //       items: L10n.all.map(
                          //         (locale) {
                          //           final flag =
                          //               L10n.getFlag(locale.languageCode);

                          //           return DropdownMenuItem(
                          //             child: Center(
                          //               child: Text(
                          //                 flag,
                          //                 style: TextStyle(
                          //                   fontSize: 20,
                          //                   color: Colors.green.shade300,
                          //                   decoration:
                          //                       TextDecoration.underline,
                          //                 ),
                          //               ),
                          //             ),
                          //             value: locale,
                          //             onTap: () {
                          //               final provider =
                          //                   Provider.of<LocaleProvider>(context,
                          //                       listen: false);

                          //               provider.setLocale(locale);
                          //             },
                          //           );
                          //         },
                          //       ).toList(),
                          //       onChanged: (_) {},
                          //     ),
                          //   ),
                          // ),
                        ]),
                    SizedBox(
                      width: 5,
                    ),
                    Image(
                        height: MediaQuery.of(context).size.width * 0.5,
                        image: AssetImage('assets/images/login.png')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 340.0,
                        ),
                      ],
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          // _emailField(state),
                          // _passwordField(state),
                          // _forgotButton(context),
                          // _loginButton(state),
                          Container(
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: [
                                // _signUpButton(context),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(primary: Colors.black),
                        onPressed: () {},
                        child: Text(
                          'term of use',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    Container(
                        height: 15,
                        child: VerticalDivider(color: Colors.black)),
                    Expanded(
                        child: TextButton(
                      style: TextButton.styleFrom(primary: Colors.black),
                      onPressed: () {},
                      child: Text(
                        'privacy',
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    )),
                  ],
                ),
              ),
              LoginForm(),
              Divider(
                color: Colors.black,
                indent: 30,
                endIndent: 30,
              ),
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 80.0,
                    ),
                    Image(
                        height: 50,
                        image: AssetImage('assets/images/EU4Business.png')),
                    SizedBox(
                      width: 40,
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Image(
                        height: 38, image: AssetImage('assets/images/Giz.png')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // body:
    );
    // body:
  }
}
