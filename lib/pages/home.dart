import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAuth = false;

  Widget buildAuthScreen() {
    return Text('Authenticated');
  }

  Scaffold buildUnAuthScreen() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Sircle',
            style: TextStyle(
                fontFamily: "Signatra", fontSize: 60.0, color: Colors.white),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              GestureDetector(
                  child: Container(
                width: 260,
                height: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/google_signin_button.png'),
                  ),
                ),
              )),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }
}
