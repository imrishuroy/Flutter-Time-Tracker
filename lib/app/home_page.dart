import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/services/auth.dart';

import 'package:time_tracker/widgets/platform_alert_dialog.dart';

class HomePage extends StatelessWidget {
  // // final VoidCallback onSignOut;
  // final AuthBase auth;

  // HomePage({
  //   @required this.auth,
  // });

  Future<void> _signOut(BuildContext context) async {
    // final auth = AuthProvider.of(context);
    final auth = Provider.of<AuthBase>(context);
    try {
      // await FirebaseAuth.instance.signOut();
      await auth.signOut();
      // onSignOut();
    } catch (error) {
      print(error);
    }
  }

  // confirming logout
  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatFormAlertDialog(
      title: 'LogOut',
      content: 'Do you really want to logout',
      defaultActionText: 'LogOut',
      cancelActionText: 'Cancel',
    ).show(context);
    if (didRequestSignOut == true) {
      _signOut(context);
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
            onPressed: () => _confirmSignOut(context),
          ),
        ],
      ),
    );
  }
}
