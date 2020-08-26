import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_order_delivery/provider/firebase_auth_provider.dart';
import 'package:food_order_delivery/provider/number_of_orders.dart';
import 'package:food_order_delivery/reset_password.dart';
import 'package:provider/provider.dart';
import 'login_screen_widgets/logo_part.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  bool isLogIn = true;
  String textOfButton = 'Log in';
  void _toggleFormType() {
    setState(() {
      isLogIn = isLogIn == true ? false : true;
      textOfButton = textOfButton == 'Log in' ? 'Sign up' : 'Log in';
    });
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    bool isFilled =
        _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LogoPart(),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        FlatButton(
                          splashColor: Colors.transparent,
                          onPressed: () {
                            if (isLogIn == false) {
                              _toggleFormType();
                            }
                          },
                          child: Text('Log in',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                        ),
                        isLogIn
                            ? DividerLine(color: Color(0xFFF4D479))
                            : DividerLine(color: Colors.white),
                      ],
                    ),
                    Column(
                      children: [
                        FlatButton(
                          splashColor: Colors.transparent,
                          onPressed: () {
                            if (isLogIn == true) {
                              _toggleFormType();
                            }
                          },
                          child: Text('Sign up',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                        ),
                        isLogIn
                            ? DividerLine(color: Colors.white)
                            : DividerLine(color: Color(0xFFF4D479)),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildEmailTextField(),
                      SizedBox(height: 8),
                      buildPasswordTextField(),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FlatButton(
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ResetPassword()),
                            ),
                            child: Text(
                              isLogIn == true ? 'Forgot Password!' : '',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                      ButtonTheme(
                        height: 44,
                        child: RaisedButton(
                          color: Colors.orange,
                          textColor: Colors.white,
                          onPressed: () {
                            if (isFilled) {
                              if (isLogIn == true) {
                                Provider.of<FirebaseAuthProvider>(context,
                                        listen: false)
                                    .signInUser(_emailController.text,
                                        _passwordController.text);
                              } else {
                                Provider.of<FirebaseAuthProvider>(context,
                                        listen: false)
                                    .createUser(_emailController.text,
                                        _passwordController.text);
                              }
                            }
                          },
                          child: Text(textOfButton,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w700)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextField buildPasswordTextField() {
    return TextField(
      controller: _passwordController,
      textInputAction: TextInputAction.done,
      focusNode: passwordFocus,
      obscureText: true,
      // onEditingComplete: () {
      //   _submit();
      // },
      onChanged: (password) {
        setState(() {});
      },
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
        hintText: 'Enter your password',
        hintStyle: TextStyle(fontSize: 12, color: Colors.grey[300]),
      ),
      style: TextStyle(fontSize: 18.0),
    );
  }

  TextField buildEmailTextField() {
    return TextField(
      controller: _emailController,
      focusNode: emailFocus,
      textInputAction: TextInputAction.next,
      autocorrect: false,
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(passwordFocus);
      },
      onChanged: (email) {
        setState(() {});
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
        hintText: 'Enter your email',
        hintStyle: TextStyle(fontSize: 12, color: Colors.grey[300]),
      ),
      style: TextStyle(fontSize: 18.0),
    );
  }
}

class DividerLine extends StatelessWidget {
  const DividerLine({
    Key key,
    this.color,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      width: 40,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 2.0, color: color),
          left: BorderSide(width: 2.0, color: color),
          right: BorderSide(width: 2.0, color: color),
          bottom: BorderSide(width: 2.0, color: color),
        ),
      ),
    );
  }
}
