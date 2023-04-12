import 'package:pmvvm/view_model.dart';
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

  validateSignIn(String userName, String password) {
    if (userName.isEmpty) {
      ToastMessages().showWarningToast('User name is empty!');
      return;
    }

    if (password.isEmpty) {
      ToastMessages().showWarningToast('Password is empty!');
      return;
    }

    // var signIn = SignIn(userName: userName, password: password);
    // userSignIn(signIn);
  }

}
