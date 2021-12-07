import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PassworPage extends StatefulWidget {
  @override
  _PassworPageState createState() => _PassworPageState();
}

class _PassworPageState extends State<PassworPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListTile(
            leading: FaIcon(FontAwesomeIcons.facebook),
          ),
        ],
      ),
    );
  }
}
