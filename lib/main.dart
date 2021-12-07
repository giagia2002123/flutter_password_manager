import 'package:flutter/material.dart';
import 'package:flutter_password_manager/passwordpage.dart';
import 'colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Password Manager",
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: deeppurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void checkValidation() {
    if (formkey.currentState.validate()) {
      print("Validated");
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => PassworPage(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      body: Center(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.userLock,
                color: deeppurple,
                size: 100.0,
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: "customFont",
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blueGrey,
                    labelText: "Enter Password:",
                    labelStyle: TextStyle(
                      color: dark,
                    ),
                  ),
                  validator: (_var) {
                    if (_var == "demo") {
                      return null;
                    } else {
                      return "Password Doesn't Match";
                    }
                  },
                ),
              ),
              ElevatedButton(
                onPressed: checkValidation,
                child: Text("Enter"),
                style: ElevatedButton.styleFrom(
                  primary: deeppurple,
                  padding: EdgeInsets.symmetric(
                    horizontal: 50.0,
                    vertical: 10.0,
                  ),
                  textStyle: TextStyle(
                    fontSize: 20.0,
                    fontFamily: "customFont",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
