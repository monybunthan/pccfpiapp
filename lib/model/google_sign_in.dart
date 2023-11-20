// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;
      final Credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(Credential);
      await saveUser(googleUser);
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
  }

  Future saveUser(GoogleSignInAccount googleUser) async {
    FirebaseFirestore.instance.collection("users").doc(googleUser.email).set({
      "email": googleUser.email,
      "name": googleUser.displayName,
      "profilepic": googleUser.photoUrl,
      "role": "",
      "allstuff": "allstuff",
    });
    print(".....saved user data");
  }

  Future logout() async {
    // await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
