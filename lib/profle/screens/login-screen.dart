import 'package:app_ecommerce/homepage/homepage.dart';
import 'package:app_ecommerce/model/user.dart';
import 'package:app_ecommerce/profle/pallete.dart';
import 'package:app_ecommerce/profle/widgets/background-image.dart';
import 'package:app_ecommerce/profle/widgets/password-input.dart';
import 'package:app_ecommerce/profle/widgets/rounded-button.dart';
import 'package:app_ecommerce/profle/widgets/text-field-input.dart';
import 'package:app_ecommerce/utli/LoginHelper.dart';
import 'package:app_ecommerce/utli/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> implements LoginCallBack {
  DatabaseHelper db = new DatabaseHelper();

  final _userName = TextEditingController();
  final _password = TextEditingController();
  User willLoginUser;
  Future<User> result;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _userName.dispose();
    _password.dispose();
    super.dispose();
  }

  LoginResponse _response;
  _LoginScreen() {
    _response = new LoginResponse(this);
  }
  void _submit() {
    setState(() {
      _response.doLogin(_userName.text, _password.text);
    });
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
                    controller: _userName,
                  ),
                  PasswordInput(
                    icon: FontAwesomeIcons.lock,
                    hint: 'Password',
                    inputAction: TextInputAction.done,
                    controller: _password,
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
                    onTap: _submit,
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

  @override
  void onLoginError(String error) {
    Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  void onLoginSuccess(User user) {
    if (user != null) {
      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => new HomePage(),
        ),
      );
    } else {
      Fluttertoast.showToast(
          msg: 'error',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
