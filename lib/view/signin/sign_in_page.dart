import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hud/flutter_hud.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:talent_pro_assignment/utils/app_route.dart';
import 'package:talent_pro_assignment/utils/color_helper.dart';
import 'package:talent_pro_assignment/utils/constants.dart';
import 'package:talent_pro_assignment/utils/strings.dart';
import 'package:talent_pro_assignment/view/signin/sign_in_view_model.dart';
import 'package:talent_pro_assignment/widget/styles.dart';
import 'package:talent_pro_assignment/widget/widgets.dart';

class SignInPage extends StatelessWidget {

  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MVVM(
        view: () => SignInPageView(),
        viewModel: SignInViewModel()
    );
  }
}

// ignore: must_be_immutable
class SignInPageView extends StatelessView<SignInViewModel> {

  late BuildContext _context;
  late SignInViewModel _viewModel;

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  SignInPageView({super.key});

  @override
  Widget render(BuildContext context, SignInViewModel viewModel) {
    _context = context;
    _viewModel = viewModel;

    return WidgetHUD(
      showHUD: viewModel.isLoading,
      hud: Widgets().progressBar(label: Strings.signingIn),
      builder: (context) => Scaffold(
        body: _body(),
      ),
    );
  }

  _body() {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(_context).size.height,
        margin: const EdgeInsets.all(
          Constants.standardSpacing
        ),
        child: Column(
          children: [
            emailLabel(),
            emailField(),
            const SizedBox(
              height: Constants.mediumSpacing,
            ),
            passwordLabel(),
            passwordField(),
            const SizedBox(
              height: Constants.smallSpacing,
            ),
            signInButton(),
            const SizedBox(
              height: Constants.mediumSpacing,
            ),
            signUp(),
            const SizedBox(
              height: Constants.mediumSpacing,
            ),
          ],
        ),
      ),
    );
  }

  emailLabel() {
    return Row(
      children: [
        Text(
          Strings.email,
          style: Styles().labelStyle(),
        ),
        const SizedBox(
          width: Constants.extraSmallSpacing,
        ),
        Widgets().mandatory()
      ],
    );
  }

  emailField() {
    return Container(
      width: MediaQuery.of(_context).size.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: Colors.grey.shade300
          ),
          borderRadius: BorderRadius.circular(Constants.extraSmallRadius)
      ),
      child: TextFormField(
        controller: _emailTextController,
        // initialValue: viewModel.mobileNumber,
        textAlign: TextAlign.start,
        cursorColor: Colors.black54,
        keyboardType: TextInputType.text,
        maxLength: Constants.defaultLength,
        style: Styles().textFormStyle(),
        decoration: InputDecoration(
            counterText: '',
            hintText: Strings.email,
            hintStyle: GoogleFonts.poppins(
              color: Colors.grey.shade500,
              fontSize: Constants.mediumFontSize,
            ),
            prefixIcon: Icon(
              Icons.person,
              size: Constants.smallIconSize,
              color: Colors.grey.shade500,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(Constants.mediumSpacing)
        ),
        onChanged: (String newVal) {
          // viewModel.setMobileNumber(newVal);
        },
      ),
    );
  }

  passwordLabel() {
    return Row(
      children: [
        Text(
          Strings.password,
          style: Styles().labelStyle(),
        ),
        const SizedBox(
          width: Constants.extraSmallSpacing,
        ),
        Widgets().mandatory()
      ],
    );
  }

  passwordField() {
    return Container(
      width: MediaQuery.of(_context).size.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: Colors.grey.shade300
          ),
          borderRadius: BorderRadius.circular(Constants.extraSmallRadius)
      ),
      child: TextFormField(
        controller: _passwordTextController,
        // initialValue: viewModel.mobileNumber,
        textAlign: TextAlign.start,
        cursorColor: Colors.black54,
        obscureText: _viewModel.isPasswordInvisible,
        keyboardType: TextInputType.text,
        maxLength: Constants.defaultLength,
        style: Styles().textFormStyle(),
        decoration: InputDecoration(
          counterText: '',
          hintText: Strings.password,
          hintStyle: GoogleFonts.poppins(
            color: Colors.grey.shade500,
            fontSize: Constants.mediumFontSize,
          ),
          prefixIcon: Icon(
            Icons.lock,
            size: Constants.smallIconSize,
            color: Colors.grey.shade500,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _viewModel.isPasswordInvisible ? Icons.visibility : Icons.visibility_off,
              size: Constants.smallIconSize,
              color: Colors.grey.shade500,
            ),
            onPressed: () {
              _viewModel.onPressedPasswordToggle();
            },
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(Constants.mediumSpacing),
        ),
        onChanged: (String newVal) {
          // viewModel.setMobileNumber(newVal);
        },
      ),
    );
  }

  signInButton() {
    return SizedBox(
      width: MediaQuery.of(_context).size.width,
      height: Constants.extraSmallHeight,
      child: ElevatedButton(
        style: Styles().elevatedButtonPrimary(),
        child: Center(
            child: Text(
              Strings.signIn,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w500
              ),
            )
        ),
        onPressed: () {
          _viewModel.validateSignIn(
              _emailTextController.text,
              _passwordTextController.text
          );
        },
      ),
    );
  }

  signUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Strings.dontHaveAnAccount,
          style: GoogleFonts.poppins(
              fontSize: Constants.mediumFontSize,
              color: Colors.black
          ),
        ),
        TextButton(
          child: Text(
              Strings.signUp,
              style: GoogleFonts.poppins(
                fontSize: Constants.mediumFontSize,
                fontWeight: FontWeight.w700,
                color: ColorHelper.primaryDarkColor,
              )
          ),
          onPressed: () {
            Navigator.pushNamed(_context, AppRoute.signUp);
          },
        )
      ],
    );
  }
}
