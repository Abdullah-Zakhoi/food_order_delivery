import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void resetPassword(String email) async {
      try {
        final authResult =
            await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      } catch (e) {
        print(e.toString());
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Food delivery'),
        leading: BackButton(),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(fontSize: 12, color: Colors.grey[300]),
                  ),
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 8),
                ButtonTheme(
                  height: 44,
                  child: RaisedButton(
                    color: Colors.orange,
                    textColor: Colors.white,
                    onPressed: () {
                      resetPassword(_emailController.text);
                    },
                    child: Text('Reset Password',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
