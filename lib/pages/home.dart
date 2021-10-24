import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sircle/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sircle/pages/activity_feed.dart';
import 'package:sircle/pages/profile.dart';
import 'package:sircle/pages/search.dart';
import 'package:sircle/pages/timeline.dart';
import 'package:sircle/pages/upload.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAuth = false;
  late PageController pageController;
  int pageIndex = 0;

  @override
  initState() {
    pageController = PageController();

    // Detects when user is signed in or out
    googleSignIn.onCurrentUserChanged.listen((account) {
      handleSignIn(account);
    }, onError: (err) {
      print('Error signing in: $err');
    });

    //Reauthenticate user when app is reopned
    googleSignIn
        .signInSilently(suppressErrors: false)
        .then((account) => handleSignIn(account))
        .catchError((err) => print('Error signing in: $err'));

    super.initState();
  }

  @override
  dispose() {
    pageController.dispose();
    super.dispose();
  }

  handleSignIn(GoogleSignInAccount? account) {
    if (account != null) {
      print('User signed in!: $account');
      setState(() {
        isAuth = true;
      });
    } else {
      setState(() {
        isAuth = false;
      });
    }
  }

  login() {
    print('google login');
    googleSignIn.signIn();
  }

  logout() {
    googleSignIn.signOut();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onBottomNavTap(int pageIndex) {
    pageController.jumpToPage(pageIndex);
  }

  Scaffold buildAuthScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sircle',
          style: TextStyle(
            fontFamily: "Signatra",
            fontSize: 40.0,
            color: Colors.white,
          ),
        ),
      ),
      body: PageView(
        children: [
          Timeline(),
          ActivityFeed(),
          Upload(),
          Search(),
          Profile(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        // physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: pageIndex,
        onTap: onBottomNavTap,
        activeColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.whatshot_outlined)),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active_outlined)),
          BottomNavigationBarItem(icon: Icon(Icons.photo_camera_outlined)),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined)),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: logout,
        child: Icon(Icons.logout),
      ),
    );
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
                fontFamily: "Signatra",
                fontSize: 60.0,
                color: Colors.white,
              ),
            ),
            GestureDetector(
                onTap: login,
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
