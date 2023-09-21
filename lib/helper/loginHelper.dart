import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthHelper {
  AuthHelper._pc();

  static final AuthHelper authHelpers = AuthHelper._pc();

  GoogleSignIn google = GoogleSignIn(scopes: [
    'email',
  ]);

  LoginAnonymously() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();

      return true;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Unable to login anonymously...");

          break;
        default:
          log("Exception: ${e.code}");
      }

      return false;
    }
  }

  googleSignIn() async {
    GoogleSignInAccount? account = await google.signIn();

    GoogleSignInAuthentication authentication = await account!.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      idToken: authentication.idToken,
      accessToken: authentication.accessToken,
    );

    FirebaseAuth.instance.signInWithCredential(credential);

    return account;
  }

  signOut() {
    FirebaseAuth.instance.signOut();

    google.signOut();
  }
}
