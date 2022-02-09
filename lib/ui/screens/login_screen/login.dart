import 'package:flutter/material.dart';
import 'package:smart_apaga/ui/widgets/text_button.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
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
                      ]),
                  const SizedBox(
                    width: 5,
                  ),
                  Image(
                      height: MediaQuery.of(context).size.width * 0.5,
                      image: const AssetImage('assets/images/login.png')),
                  const SizedBox(height: 20.0),
                  const LoginForm(),
             
                  Container(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        TextButtonForAll(
                          style: TextButton.styleFrom(
                            primary: Colors.teal,
                          ),
                          text: const Text(
                            'Sign up',
                            style: TextStyle(fontSize: 18, color: Colors.green),
                          ),
                          onPressed: () {
                            print('go to Register screen');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              // ignore: avoid_unnecessary_containers
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: TextButtonForAll(
                        style: TextButton.styleFrom(primary: Colors.black),
                        text: const Text(
                          'Terms of Use',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        onPressed: () {
                          print('terms of use');
                        },
                      ),
                    ),
                    // ignore: sized_box_for_whitespace
                    Container(
                        height: 15,
                        child: const VerticalDivider(color: Colors.black)),
                    Expanded(
                        child: TextButtonForAll(
                      style: TextButton.styleFrom(primary: Colors.black),
                      text: const Text(
                        'Privacy Policy',
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      onPressed: () {
                        print('privacy policy');
                      },
                    )),
                  ],
                ),
              ),
              const Divider(
                color: Colors.black,
                indent: 30,
                endIndent: 30,
              ),
              // ignore: avoid_unnecessary_containers
              Container(
                child: Row(
                  children: const [
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
