import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final Function() onSignOut;

  HomePage({@required this.onSignOut});

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
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
