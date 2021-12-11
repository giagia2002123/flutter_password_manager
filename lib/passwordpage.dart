import 'package:flutter/material.dart';
import 'package:flutter_password_manager/dbhelper.dart';
import 'colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PassworPage extends StatefulWidget {
  @override
  _PassworPageState createState() => _PassworPageState();
}

class _PassworPageState extends State<PassworPage> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final dbhelper = Databasehelper.instance;
  String type;
  String user;
  String pass;
  var allrows;

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

  void insertdata() async {
    Navigator.pop(context);
    Map<String, dynamic> row = {
      Databasehelper.columnType: type,
      Databasehelper.columnUser: user,
      Databasehelper.columnPass: pass,
    };
    final id = await dbhelper.insert(row);
    print(id);
    setState(() {});
  }

  Future queryall() async {
    allrows = await dbhelper.queryall();
    allrows.forEach((row) {
      print(row);
    });
    print(allrows);
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
                        onChanged: (_val) {
                          type = _val;
                        },
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
                          validator: validateempty,
                          onChanged: (_val) {
                            user = _val;
                          },
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
                        validator: validateempty,
                        onChanged: (_val) {
                          pass = _val;
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (formstate.currentState.validate()) {
                              print("Ready To Enter Data");
                              insertdata();
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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Saved Passwords",
          style: TextStyle(
            fontFamily: "customFont",
          ),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addPassword,
        child: FaIcon(FontAwesomeIcons.plus),
        backgroundColor: deeppurple,
        foregroundColor: Colors.white,
      ),
      backgroundColor: dark,
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData != null) {
            if (allrows.length == 0) {
              return Center(
                child: Text(
                  "No Data Available\nClick On Te Add Button To Enter Some !",
                  style: TextStyle(
                    color: lightpurple,
                    fontSize: 20.0,
                    fontFamily: "customFont",
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return Center(
                child: Container(
                  decoration: BoxDecoration(),
                  width: MediaQuery.of(context).size.width * 0.93,
                  child: ListView.builder(
                    itemCount: allrows.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                          top: 20.0,
                        ),
                        decoration: BoxDecoration(
                          color: deeppurple,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Column(
                          children: <Widget>[
                            Text(
                              allrows[index]['type'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily: "customFont",
                              ),
                            ),
                            ListTile(
                              leading: FaIcon(
                                FontAwesomeIcons.userSecret,
                                size: 40.0,
                                color: Colors.white,
                              ),
                              title: Text(
                                allrows[index]['user'],
                                style: titleStyle,
                              ),
                              subtitle: Text(
                                allrows[index]['pass'],
                                style: subtitleStyle,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        future: queryall(),
      ),
    );
  }
}
