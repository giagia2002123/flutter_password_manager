import 'package:flutter/material.dart';
import 'colors.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      body: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(30.0),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: "customFont",
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
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
