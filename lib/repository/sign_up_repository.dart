import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talent_pro_assignment/model/result.dart';
import 'package:talent_pro_assignment/utils/strings.dart';

class SignUpRepository {

  late ValueChanged<Result> onSignUpComplete;

  signUp(
      String emailAddress,
      String password,
      ValueChanged<Result> onSignUpComplete
  ) async {
    try {
      this.onSignUpComplete = onSignUpComplete;

      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      if (credential.user != null) {
        this.onSignUpComplete(
            Result(
                true,
                'Sign up is successful. Please sign in to continue.',
                credential
            )
        );
        return;
      }

      this.onSignUpComplete(Result(false, Strings.errorMessage, null));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        this.onSignUpComplete(Result(false, 'The password provided is too weak!', null));
        return;
      }

      if (e.code == 'email-already-in-use') {
        this.onSignUpComplete(Result(false, 'The account already exists for that email!', null));
        return;
      }

      this.onSignUpComplete(Result(false, e.message.toString(), null));
    } catch (e) {
      this.onSignUpComplete(Result(false, Strings.errorMessage, null));
    }
  }
}