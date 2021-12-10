import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PassworPage extends StatefulWidget {
  @override
  _PassworPageState createState() => _PassworPageState();
}

class _PassworPageState extends State<PassworPage> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  TextStyle titleStyle = TextStyle(
    fontSize: 18.0,
    fontFamily: "customFont",
    color: Colors.white,
  );

  TextStyle subtitleStyle = TextStyle(
    fontSize: 16.0,
    fontFamily: "customFont",
    color: Colors.white70,
  );

  String validateempty(_val) {
    if (_val.isEmpty) {
      return "Required Field";
    } else {
      return null;
    }
  }

  void addPassword() {
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              title: Text(
                "Add Data",
                style: titleStyle,
              ),
              backgroundColor: deeppurple,
              contentPadding: EdgeInsets.all(30.0),
              children: <Widget>[
                Form(
                  key: formstate,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Select Type",
                          labelStyle: subtitleStyle,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: dark),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: dark),
                          ),
                        ),
                        style: titleStyle,
                        validator: validateempty,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Enter Username/Email",
                            labelStyle: subtitleStyle,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: dark),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: dark),
                            ),
                          ),
                          style: titleStyle,
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Enter Password",
                          labelStyle: subtitleStyle,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: dark),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: dark),
                          ),
                        ),
                        style: titleStyle,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (formstate.currentState.validate()) {
                              print("Ready To Enter Data");
                            }
                          },
                          child: Text("ADD"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.cyan,
                            padding: EdgeInsets.symmetric(
                              horizontal: 35.0,
                              vertical: 10.0,
                            ),
                            elevation: 5.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: addPassword,
        child: FaIcon(FontAwesomeIcons.plus),
        backgroundColor: deeppurple,
        foregroundColor: Colors.white,
      ),
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
                style: titleStyle,
              ),
              subtitle: Text(
                "Password",
                style: subtitleStyle,
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
                style: titleStyle,
              ),
              subtitle: Text(
                "Password",
                style: subtitleStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
