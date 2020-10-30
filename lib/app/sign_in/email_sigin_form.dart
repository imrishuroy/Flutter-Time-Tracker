import 'package:flutter/material.dart';
import 'package:time_tracker/widgets/form_submit_button.dart';

enum EmailSigInFormType { sigIn, register }

class EmailSigInForm extends StatefulWidget {
  // String email;

  @override
  _EmailSigInFormState createState() => _EmailSigInFormState();
}

class _EmailSigInFormState extends State<EmailSigInForm> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  EmailSigInFormType _formType = EmailSigInFormType.sigIn;

  void _submit() {
    print(
        'email : ${_emailController.text} , password: ${_passwordController.text}');
  }

  void _toggleFormType() {
    setState(() {
      _formType = _formType == EmailSigInFormType.sigIn
          ? EmailSigInFormType.register
          : EmailSigInFormType.sigIn;
      _emailController.clear();
      _passwordController.clear();
    });
  }

  List<Widget> _buildChildren() {
    final primaryText =
        _formType == EmailSigInFormType.sigIn ? 'Sign In' : 'Create an account';

    final secondaryText = _formType == EmailSigInFormType.sigIn
        ? 'Need an account? Register'
        : 'Have an account? sign In';
    return [
      TextField(
        controller: _emailController,
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'Enter your email',
        ),
        // onChanged: (value) {
        //   email = value;
        // },
      ),
      SizedBox(height: 10),
      TextField(
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Enter your password',
        ),
      ),
      SizedBox(height: 10),
      FormSubmitButton(
        text: primaryText,
        onPressed: _submit,
      ),
      FlatButton(
        onPressed: _toggleFormType,
        child: Text(
          secondaryText,
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
