import 'package:flutter/material.dart';
import 'package:time_tracker/widgets/form_submit_button.dart';

class EmailSigInForm extends StatelessWidget {
  List<Widget> _buildChildren() {
    return [
      TextField(
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'Enter your email',
        ),
      ),
      SizedBox(height: 10),
      TextField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Enter your password',
        ),
      ),
      SizedBox(height: 10),
      FormSubmitButton(
        text: 'Sign In',
        onPressed: () {},
      ),
      FlatButton(
        onPressed: () {},
        child: Text(
          'Need an Account ? Register',
          style: TextStyle(
            color: Colors.blue[700],
          ),
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),
      ),
    );
  }
}
