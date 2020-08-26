import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_order_delivery/login_screen.dart';

import 'home_screen.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
//    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 5000), () {
      print('>>>>>>>>>>>>>> no way');
      return MaterialApp(
        home: Scaffold(
          body: Container(
            child: Center(
              child: Text(
                'no Connection State',
                style: TextStyle(fontSize: 22, color: Colors.blue),
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder<User>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            User user = snapshot.data;
            if (snapshot.connectionState == ConnectionState.active) {
              if (user == null) {
                return LogInPage();
              }
              return HomePage();
            } else {
              return Scaffold(
                body: Container(
                  child: Center(
                    child: Text('there is not conection'),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
