import 'package:flutter/material.dart';
import 'package:pmvvm/view_model.dart';
import 'package:talent_pro_assignment/model/result.dart';
import 'package:talent_pro_assignment/repository/sign_in_repository.dart';
import 'package:talent_pro_assignment/utils/app_route.dart';
import 'package:talent_pro_assignment/utils/toast_messages.dart';

class SignInViewModel extends ViewModel {

  var isLoading = false;
  var isPasswordInvisible = true;

  @override
  void init() {}

  showProgressBar() {
    isLoading = true;
    notifyListeners();
  }

  hideProgressBar() {
    isLoading = false;
    notifyListeners();
  }

  onPressedPasswordToggle() {
    isPasswordInvisible = !isPasswordInvisible;
    notifyListeners();
  }

  validateSignIn(String email, String password) {
    if (email.isEmpty) {
      ToastMessages().showWarningToast('Email name is empty!');
      return;
    }

    if (password.isEmpty) {
      ToastMessages().showWarningToast('Password is empty!');
      return;
    }

    signIn(email, password);
  }

  signIn(String emailAddress, String password,) async {
    showProgressBar();
    await SignInRepository().signIn(emailAddress, password, _onSignInComplete);
  }

  _onSignInComplete(Result result) {
    if (result.isSuccess) {
      Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoute.home,
          (route) => false,
          arguments: result.data
      );
    } else {
      ToastMessages().showErrorToast(result.message!);
    }

    hideProgressBar();
  }
}
