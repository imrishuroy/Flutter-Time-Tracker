import 'package:flutter/material.dart';
import 'package:time_tracker/services/auth.dart';

import 'email_sigin_form.dart';

class EmailSigInPage extends StatelessWidget {
  final AuthBase auth;
  EmailSigInPage({@required this.auth});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.grey[200],
        title: Text('SignIn'),
        elevation: 2.0,
        // backgroundColor: Colors.grey[200],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Card(
          child: EmailSigInForm(
            auth: auth,
          ),
        ),
      ),
    );
  }
}
