import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:talent_pro_assignment/model/result.dart';
import 'package:talent_pro_assignment/repository/home_repository.dart';
import 'package:talent_pro_assignment/utils/app_route.dart';
import 'package:talent_pro_assignment/utils/toast_messages.dart';

class HomeViewModel extends ViewModel {

  var isLoading = false;
  String? userName;
  String? mobileNumber;
  String? address;

  late final UserCredential? _userCredential;

  HomeViewModel(this._userCredential);

  @override
  void init() {
    if (_userCredential?.user != null) {
      fetchData();
    }
  }

  showProgressBar() {
    isLoading = true;
    notifyListeners();
  }

  hideProgressBar() {
    isLoading = false;
    notifyListeners();
  }

  setUserName(String newVal) {
    userName = newVal;
    notifyListeners();
  }

  setMobileNumber(String newVal) {
    mobileNumber = newVal;
    notifyListeners();
  }

  setAddress(String newVal) {
    address = newVal;
    notifyListeners();
  }

  fetchData() async {
    showProgressBar();
    await HomeRepository().getUserInfo(_userCredential!.user!.uid, _onDataFetch);
  }

  submitUserInfo() async {
    showProgressBar();
    await HomeRepository().setUserInfo(
      _userCredential!.user!.uid,
      userName,
      mobileNumber,
      address,
      _onSetComplete
    );
  }

  logOut() async {
    await HomeRepository().logOut();
    navigateToLogin();
  }

  navigateToLogin() {
    Navigator.pushNamedAndRemoveUntil(context, AppRoute.signIn, (route) => false);
  }

  _onSetComplete(Result result) {
    if (result.isSuccess) {
      ToastMessages().showSuccessToast(result.message!);
      // Navigator.pop(context);
    } else {
      ToastMessages().showErrorToast(result.message!);
    }

    hideProgressBar();
  }

  _onDataFetch(Result result) {
    if (result.isSuccess) {
      setUserName(result.data['userName']);
      setMobileNumber(result.data['mobileNumber']);
      setAddress(result.data['address']['line1']);
      // Navigator.pop(context);
    } else {
      ToastMessages().showErrorToast(result.message!);
    }

    hideProgressBar();
  }
}
