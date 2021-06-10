import 'package:app_ecommerce/homepage/homepage.dart';
import 'package:app_ecommerce/model/user.dart';
import 'package:app_ecommerce/profle/pallete.dart';
import 'package:app_ecommerce/profle/widgets/background-image.dart';
import 'package:app_ecommerce/profle/widgets/password-input.dart';
import 'package:app_ecommerce/profle/widgets/rounded-button.dart';
import 'package:app_ecommerce/profle/widgets/text-field-input.dart';
import 'package:app_ecommerce/utli/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  DatabaseHelper db = new DatabaseHelper();

  final userNameInput = TextEditingController();
  final passWordInput = TextEditingController();
  User willLoginUser;
  Future<User> result;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    userNameInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(
          image: 'assets/sunset.jpeg',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    'Sora shop',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextInputField(
                    icon: FontAwesomeIcons.envelope,
                    hint: 'Email',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                    controller: userNameInput,
                  ),
                  PasswordInput(
                    icon: FontAwesomeIcons.lock,
                    hint: 'Password',
                    inputAction: TextInputAction.done,
                    controller: passWordInput,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'ForgotPassword'),
                    child: Text(
                      'Forgot Password',
                      style: kBodyText,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () => {
                      willLoginUser = new User(userNameInput.text,
                          passWordInput.text, userNameInput.text),
                      result = db.getWillLoginUser(willLoginUser),
                      if (result != null)
                        {
                          // Navigator.push(
                          //   context,
                          //   new MaterialPageRoute(
                          //     builder: (context) => new HomePage(),
                          //   ),
                          // )
                          Fluttertoast.showToast(
                              msg: "OK",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0)
                        }
                      else
                        {
                          Fluttertoast.showToast(
                              msg: "The Username / Password is incorrect",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0)
                        }
                      // Fluttertoast.showToast(
                      //     msg: "This is Center Short Toast",
                      //     toastLength: Toast.LENGTH_SHORT,
                      //     gravity: ToastGravity.CENTER,
                      //     timeInSecForIosWeb: 1,
                      //     backgroundColor: Colors.red,
                      //     textColor: Colors.white,
                      //     fontSize: 16.0)
                      // showDialog(
                      //   context: context,
                      //   builder: (context) {
                      //     return AlertDialog(
                      //       // Retrieve the text the that user has entered by using the
                      //       // TextEditingController.
                      //       content: Text(passWordInput.text),
                      //     );
                      //   },
                      // )
                      // onPressed: () {
                      // },
                      // Navigator.push(
                      //   context,
                      //   new MaterialPageRoute(
                      //     builder: (context) => new HomePage(),
                      //   ),
                      // )
                    },
                    child: RoundedButton(
                      buttonName: 'Login',
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'CreateNewAccount'),
                child: Container(
                  child: Text(
                    'Create New Account',
                    style: kBodyText,
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(width: 1, color: kWhite))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
