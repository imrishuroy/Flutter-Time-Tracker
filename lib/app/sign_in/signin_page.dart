import 'package:flutter/material.dart';
import 'package:time_tracker/widgets/custom_raised_button.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 2.0,
        title: Text('Time Tracker'),
      ),
      body: _buildContents(),
    );
  }

  Padding _buildContents() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign In',
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          CustomRaisedButton(
            child: Text(
              'Sign In with Google',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
              ),
            ),
            color: Colors.white,
            borderRadius: 5,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
