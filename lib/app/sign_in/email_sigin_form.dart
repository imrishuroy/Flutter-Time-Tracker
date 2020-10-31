import 'package:flutter/material.dart';
import 'package:time_tracker/app/sign_in/validator.dart';
import 'package:time_tracker/services/auth.dart';
import 'package:time_tracker/widgets/form_submit_button.dart';

enum EmailSigInFormType { sigIn, register }

class EmailSigInForm extends StatefulWidget with EmailAndPasswordValidators {
  // String email;
  final AuthBase auth;
  EmailSigInForm({@required this.auth});

  @override
  _EmailSigInFormState createState() => _EmailSigInFormState();
}

class _EmailSigInFormState extends State<EmailSigInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  EmailSigInFormType _formType = EmailSigInFormType.sigIn;

  String get _email => _emailController.text;
  String get _password {
    return _passwordController.text;
  }

  void _submit() async {
    // print(
    //     'email : ${_emailController.text} , password: ${_passwordController.text}');
    try {
      if (_formType == EmailSigInFormType.sigIn) {
        await widget.auth.sigInWithEmailAndPassword(_email, _password);
      } else {
        await widget.auth.createUserWithEmailAndPassword(_email, _password);
      }
      Navigator.of(context).pop();
    } catch (error) {
      print(error.toString());
    }
  }

  void _emailEditingComplete() {
    //  print('Email editing complete');
    FocusScope.of(context).requestFocus(_passwordFocusNode);
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

// aditional variable for enableing/disableing submit button
    // bool submitEnabled = _email.isNotEmpty && _password.isNotEmpty;

    bool submitEnabled = widget.emailValidator.isValid(_email) &&
        widget.passwordValidator.isValid(_password);
    return [
      _buildEmailTextField(),
      SizedBox(height: 10),
      _buildPasswordTextField(),
      SizedBox(height: 10),
      FormSubmitButton(
        text: primaryText,
        onPressed: submitEnabled ? _submit : null,
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

  TextField _buildPasswordTextField() {
    bool passwordValid = widget.emailValidator.isValid(_password);
    return TextField(
      controller: _passwordController,
      focusNode: _passwordFocusNode,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        errorText: passwordValid ? null : widget.invalidPasswordErrorText,
      ),
      textInputAction: TextInputAction.done,
      onEditingComplete: _submit,
      onChanged: (password) => _updateState(),
    );
  }

  TextField _buildEmailTextField() {
    bool emailValid = widget.emailValidator.isValid(_email);
    return TextField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      onEditingComplete: _emailEditingComplete,
      decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'Enter your email',
          errorText: emailValid ? null : widget.invalidEmailErrorText),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      // onChanged: (value) {
      //   email = value;
      // },
      onChanged: (email) => _updateState(),
    );
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

  void _updateState() {
    setState(() {});
  }
}
