import 'package:flutter/material.dart';
import 'package:time_tracker/app/sign_in/signin_page.dart';
import 'package:time_tracker/services/auth.dart';

import '../home_page.dart';

class LandingPage extends StatefulWidget {
  final AuthBase auth;
  LandingPage({@required this.auth});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // firebase user
  // User _user;

  AppUser _user;

  @override
  void initState() {
    super.initState();
    _checkCurrentUser();

    widget.auth.onAuthStateChanged.listen((user) {
      print('user: ${user?.uid}');
    });

    // User user = FirebaseAuth.instance.currentUser;
    // _updateUser(user);
  }

  Future<void> _checkCurrentUser() async {
    // User user = await FirebaseAuth.instance.currentUser;
    AppUser user = widget.auth.currentUser();

    _updateUser(user);
  }

  void _updateUser(AppUser user) {
    print('User Id ${user.uid}');
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          AppUser user = snapshot.data;
          if (user == null) {
            return SignInPage(
              auth: widget.auth,
              onSignIn: _updateUser,
            );
          }
          return HomePage(
            auth: widget.auth,
            onSignOut: () => _updateUser(null),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
