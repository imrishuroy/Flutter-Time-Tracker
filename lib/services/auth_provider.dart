// import 'package:flutter/material.dart';
// import 'package:time_tracker/services/auth.dart';

// class AuthProvider extends InheritedWidget {
//   final AuthBase auth;
//   final Widget child;

//   AuthProvider({
//     @required this.auth,
//     @required this.child,
//   });

//   @override
//   bool updateShouldNotify(covariant InheritedWidget oldWidget) {
//     return false;
//   }

//   static AuthBase of(BuildContext context) {
//     AuthProvider provider =
//         context.dependOnInheritedWidgetOfExactType(aspect: AuthProvider);

//     return provider.auth;
//   }
// }