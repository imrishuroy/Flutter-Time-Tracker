import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/app/sign_in/email_sigin_page.dart';
import 'package:time_tracker/app/sign_in/sign_in_button.dart';
import 'package:time_tracker/app/sign_in/social_sigin_button.dart';
import 'package:time_tracker/services/auth.dart';

class SignInPage extends StatelessWidget {
  // SignInPage({
  //   @required this.auth,
  // });
  // // final Function(AppUser) onSignIn;

  // final AuthBase auth;

  void _signInAnonymously(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      // final authResult = await FirebaseAuth.instance.signInAnonymously();
      await auth.signInAnonymously();
      // print('${authResult.user.uid}');
      // onSignIn(user);
    } catch (error) {
      print(error.toString());
    }
  }

  void _signInWithGoogle(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithGoogle();
      // print('${authResult.user.uid}');
    } catch (error) {
      print(error.toString());
    }
  }

  void _signInWithFacebok(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithFacebook();
      // print('${authResult.user.uid}');
    } catch (error) {
      print(error.toString());
    }
  }

  void _signInWithEmail(BuildContext context) {
    // show sigin page
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => EmailSigInPage(
            // auth: auth,
            ),
        fullscreenDialog: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 2.0,
        title: Text('Time Tracker'),
      ),
      body: _buildContents(context),
    );
  }

  Padding _buildContents(BuildContext context) {
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
          SizedBox(height: 8.0),
          SocialSignInButton(
            imageUrl: 'google',
            text: 'Sign In with google',
            textColor: Colors.black87,
            onPressed: () => _signInWithGoogle(context),
            color: Colors.white,
          ),
          SizedBox(
            height: 8.0,
          ),
          SocialSignInButton(
            imageUrl: 'facebook',
            text: 'Sign In with Facebook',
            textColor: Colors.white,
            onPressed: () => _signInWithFacebok(context),
            color: Color(0xff334d92),
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
            text: 'Sign In with Email',
            textColor: Colors.white,
            onPressed: () => _signInWithEmail(context),
            color: Colors.teal[700],
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'or',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
            text: 'Go Anonymous',
            textColor: Colors.black,
            onPressed: () => _signInAnonymously(context),
            color: Colors.lime,
          ),
        ],
      ),
    );
  }
}
