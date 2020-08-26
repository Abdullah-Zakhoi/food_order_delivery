import 'package:flutter/material.dart';

class LogoPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'images/icons.png',
          width: MediaQuery.of(context).size.width,
        ),
        Image.asset(
          'images/logo.png',
          width: 150,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Orix Food',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Delivery App',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
