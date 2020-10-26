import 'package:flutter/material.dart';
import 'package:time_tracker/services/auth.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onSignOut;
  final AuthBase auth;

  HomePage({@required this.auth, this.onSignOut});

  Future<void> _signOut() async {
    try {
      // await FirebaseAuth.instance.signOut();
      await auth.signOut();
      onSignOut();
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.red,
              size: 30,
            ),
            onPressed: _signOut,
          ),
        ],
      ),
    );
  }
}
