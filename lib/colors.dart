import 'package:flutter/material.dart';

Color dark = Color(0xff1e272e);
Color lightpurple = Color(0xff575fcf);
Color deeppurple = Color(0xff3c40c6);

/*
body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData != null) {
            return Center(
              child: Column(
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
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        future: queryall(),
      ),
*/

/*
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
                        child: ListTile(
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
  */