import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/app/sign_in/signin_page.dart';

import '../home_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // firebase user
  User _user;

  @override
  void initState() {
    super.initState();
    // _checkCurrentUser();

    User user = FirebaseAuth.instance.currentUser;
    _updateUser(user);
  }

  // Future<void> _checkCurrentUser() async {
  //   User user = await FirebaseAuth.instance.currentUser;

  //   _updateUser(user);
  // }

  void _updateUser(User user) {
    print('User Id ${user.uid}');
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignInPage(
        onSignIn: _updateUser,
      );
    }
    // temporary placeholder for homepage
    return HomePage(
      onSignOut: () => _updateUser(null),
    );
  }
}
