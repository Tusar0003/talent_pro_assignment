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
import 'package:talent_pro_assignment/view/signup/sign_up_view_model.dart';
import 'package:talent_pro_assignment/widget/styles.dart';
import 'package:talent_pro_assignment/widget/widgets.dart';

class SignUpPage extends StatelessWidget {

  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MVVM(
        view: () => SignUpPageView(),
        viewModel: SignUpViewModel()
    );
  }
}

// ignore: must_be_immutable
class SignUpPageView extends StatelessView<SignUpViewModel> {

  late BuildContext _context;
  late SignUpViewModel _viewModel;

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPasswordTextController = TextEditingController();

  SignUpPageView({super.key});

  @override
  Widget render(BuildContext context, SignUpViewModel viewModel) {
    _context = context;
    _viewModel = viewModel;

    return WidgetHUD(
      showHUD: viewModel.isLoading,
      hud: Widgets().progressBar(),
      builder: (context) => Scaffold(
        appBar: Widgets().appBar(Strings.signUp),
        body: body(),
      ),
    );
  }

  body() {
    return SafeArea(
      child: SingleChildScrollView(
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
                height: Constants.smallSpacing,
              ),
              passwordLabel(),
              passwordField(),
              const SizedBox(
                height: Constants.smallSpacing,
              ),
              confirmPasswordLabel(),
              confirmPasswordField(),
              const SizedBox(
                height: Constants.mediumSpacing,
              ),
              signUpButton(),
              const SizedBox(
                height: Constants.mediumSpacing,
              ),
            ],
          ),
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
        textAlign: TextAlign.start,
        cursorColor: Colors.black54,
        keyboardType: TextInputType.emailAddress,
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

  confirmPasswordLabel() {
    return Row(
      children: [
        Text(
          Strings.confirmPassword,
          style: Styles().labelStyle(),
        ),
        const SizedBox(
          width: Constants.extraSmallSpacing,
        ),
        Widgets().mandatory()
      ],
    );
  }

  confirmPasswordField() {
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
        controller: _confirmPasswordTextController,
        textAlign: TextAlign.start,
        cursorColor: Colors.black54,
        obscureText: _viewModel.isConfirmPasswordInvisible,
        keyboardType: TextInputType.text,
        maxLength: Constants.defaultLength,
        style: Styles().textFormStyle(),
        decoration: InputDecoration(
          counterText: '',
          hintText: Strings.confirmPassword,
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
              _viewModel.isConfirmPasswordInvisible ? Icons.visibility : Icons.visibility_off,
              size: Constants.smallIconSize,
              color: Colors.grey.shade500,
            ),
            onPressed: () {
              _viewModel.onConfirmPressedPasswordToggle();
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

  signUpButton() {
    return SizedBox(
      width: MediaQuery.of(_context).size.width,
      height: Constants.extraSmallHeight,
      child: ElevatedButton(
        style: Styles().elevatedButtonPrimary(),
        child: Center(
            child: Text(
              Strings.signUp,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w500
              ),
            )
        ),
        onPressed: () {
          _viewModel.validateSignIn(
              _emailTextController.text,
              _passwordTextController.text,
              _confirmPasswordTextController.text,
          );
        },
      ),
    );
  }
}
