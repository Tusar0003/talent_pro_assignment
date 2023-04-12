import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talent_pro_assignment/model/result.dart';
import 'package:talent_pro_assignment/utils/strings.dart';

class SignInRepository {

  late ValueChanged<Result> onSignInComplete;

  signIn(
      String emailAddress,
      String password,
      ValueChanged<Result> onSignInComplete
  ) async {
    try {
      this.onSignInComplete = onSignInComplete;

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );

      if (credential.user != null) {
        this.onSignInComplete(Result(true, null, credential));
        return;
      }

      this.onSignInComplete(Result(false, Strings.errorMessage, null));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        this.onSignInComplete(Result(false, 'No user found for that email!', null));
        return;
      }

      if (e.code == 'wrong-password') {
        this.onSignInComplete(Result(false, 'Wrong password provided for that user!', null));
        return;
      }

      this.onSignInComplete(Result(false, e.message.toString(), null));
    }
  }
}