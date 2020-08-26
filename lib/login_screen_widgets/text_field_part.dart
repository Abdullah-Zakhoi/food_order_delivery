import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldPart extends StatefulWidget {
  TextFieldPart(
      {@required this.nameController,
      @required this.labelText,
      @required this.hintText});
  var nameController = TextEditingController();
  final String labelText;
  final String hintText;

  @override
  _TextFieldPartState createState() => _TextFieldPartState();
}

class _TextFieldPartState extends State<TextFieldPart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: TextFormField(
            controller: widget.nameController,
            decoration: InputDecoration(
              labelText: widget.labelText,
              labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
              hintText: widget.hintText,
              hintStyle: TextStyle(fontSize: 12, color: Colors.grey[300]),
            ),
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      ],
    );
  }
}
