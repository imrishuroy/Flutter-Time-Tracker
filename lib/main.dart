import 'package:flutter/material.dart';
import 'package:time_tracker/app/sign_in/signin_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      title: 'Time Tracker',
      home: SignInPage(),
    );
  }
}
