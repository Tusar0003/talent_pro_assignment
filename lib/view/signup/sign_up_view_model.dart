import 'package:flutter/cupertino.dart';
import 'package:pmvvm/view_model.dart';
import 'package:talent_pro_assignment/model/result.dart';
import 'package:talent_pro_assignment/repository/sign_up_repository.dart';
import 'package:talent_pro_assignment/utils/toast_messages.dart';

class SignUpViewModel extends ViewModel {

  var isLoading = false;
  var isPasswordInvisible = true;
  var isConfirmPasswordInvisible = true;

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

  onConfirmPressedPasswordToggle() {
    isConfirmPasswordInvisible = !isConfirmPasswordInvisible;
    notifyListeners();
  }

  validateSignIn(String email, String password, String confirmPassword) {
    if (email.isEmpty) {
      ToastMessages().showWarningToast('Email is empty!');
      return;
    }

    if (password.isEmpty) {
      ToastMessages().showWarningToast('Password is empty!');
      return;
    }

    if (confirmPassword.isEmpty) {
      ToastMessages().showWarningToast('Confirm Password is empty!');
      return;
    }

    if (password != confirmPassword) {
      ToastMessages().showWarningToast('Passwords don\'t match!');
      return;
    }

    signUp(email, password);
  }

  signUp(String email, String password) async {
    showProgressBar();
    var result = await SignUpRepository().signUp(email, password, _onSignUpComplete);
  }

  _onSignUpComplete(Result result) {
    if (result.isSuccess) {
      ToastMessages().showSuccessToast(result.message!);
      Navigator.pop(context);
    } else {
      ToastMessages().showErrorToast(result.message!);
    }

    hideProgressBar();
  }
}
