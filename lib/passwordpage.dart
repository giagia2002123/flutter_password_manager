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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: deeppurple,
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            child: ListTile(
              leading: FaIcon(
                FontAwesomeIcons.facebook,
                size: 40.0,
                color: Colors.white,
              ),
              title: Text(
                "Facebook",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                "Password",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            decoration: BoxDecoration(
              color: deeppurple,
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            child: ListTile(
              leading: FaIcon(
                FontAwesomeIcons.instagram,
                size: 40.0,
                color: Colors.white,
              ),
              title: Text(
                "Instagram",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                "Password",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
