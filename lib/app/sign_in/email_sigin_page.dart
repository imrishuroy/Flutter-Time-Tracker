import 'package:flutter/material.dart';

import 'email_sigin_form.dart';

class EmailSigInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.grey[200],
        title: Text('SignIn'),
        elevation: 2.0,
        // backgroundColor: Colors.grey[200],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(
            child: EmailSigInForm(
                // auth: auth,
                ),
          ),
        ),
      ),
    );
  }
}
