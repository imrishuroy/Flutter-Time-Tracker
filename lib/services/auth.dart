import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

// dependencies injection

class AppUser {
  final String uid;
  AppUser({@required this.uid});
}

abstract class AuthBase {
  Stream<AppUser> get onAuthStateChanged;
  AppUser currentUser();
  Future<AppUser> signInAnonymously();
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  AppUser _userFromFirebase(User firebaseUser) {
    if (firebaseUser == null) {
      return null;
    }
    return AppUser(uid: firebaseUser.uid);
  }

  @override
  Stream<AppUser> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  @override
  AppUser currentUser() {
    final user = _firebaseAuth.currentUser;
    return _userFromFirebase(user);
  }

  @override
  Future<AppUser> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
