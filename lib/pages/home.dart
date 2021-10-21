import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sircle/constants.dart';

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
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            ColourPalette.BlueNCS,
            ColourPalette.CaribbeanGreen,
            // ColourPalette.MidnightEagleGreen,
            ColourPalette.OrangeYellowCrayola,
            ColourPalette.ParadisePink,
          ],
        )),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sircle',
              style: TextStyle(
                  fontFamily: "Signatra", fontSize: 60.0, color: Colors.white),
            ),
            GestureDetector(
                onTap: () => print('ontap'),
                child: Container(
                  width: 260,
                  height: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('assets/images/google_signin_button.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }
}
