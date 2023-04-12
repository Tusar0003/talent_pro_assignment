import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hud/flutter_hud.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:talent_pro_assignment/utils/constants.dart';
import 'package:talent_pro_assignment/utils/strings.dart';
import 'package:talent_pro_assignment/view/home/home_view_model.dart';
import 'package:talent_pro_assignment/widget/styles.dart';
import 'package:talent_pro_assignment/widget/widgets.dart';

class HomePage extends StatelessWidget {

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserCredential? userCredential;

    if (ModalRoute.of(context)?.settings.arguments != null) {
      userCredential = ModalRoute.of(context)?.settings.arguments as UserCredential;
    }

    return MVVM(
      view: () => HomePageView(),
      viewModel: HomeViewModel(userCredential)
    );
  }
}

// ignore: must_be_immutable
class HomePageView extends StatelessView<HomeViewModel> {

  late BuildContext _context;
  late HomeViewModel _viewModel;

  HomePageView({super.key});

  @override
  Widget render(BuildContext context, HomeViewModel viewModel) {
    _context = context;
    _viewModel = viewModel;

    return WidgetHUD(
      showHUD: viewModel.isLoading,
      hud: Widgets().progressBar(),
      builder: (context) => Scaffold(
        appBar: appBar(),
        body: body(),
      )
    );
  }

  appBar() {
    return AppBar(
      title: Text(
        Strings.home,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            Strings.logOut,
            style: Styles().smallWhiteTextStyle(),
          ),
          onPressed: () {
            _viewModel.logOut();
          },
        )
      ],
      // backgroundColor: ColorHelper.TRANSPARENT_COLOR,
      // elevation: 0,
    );
  }

  body() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(
            Constants.standardSpacing
          ),
          child: Column(
            children: [
              userNameLabel(),
              userNameField(),
              const SizedBox(
                height: Constants.mediumSpacing,
              ),
              mobileNumberLabel(),
              mobileNumberField(),
              const SizedBox(
                height: Constants.mediumSpacing,
              ),
              addressLabel(),
              addressField(),
              const SizedBox(
                height: Constants.mediumSpacing,
              ),
              const SizedBox(
                height: Constants.mediumSpacing,
              ),
              submitButton()
            ],
          ),
        ),
      ),
    );
  }

  userNameLabel() {
    return Row(
      children: [
        Text(
          Strings.userName,
          style: Styles().labelStyle(),
        ),
        const SizedBox(
          width: Constants.extraSmallSpacing,
        ),
      ],
    );
  }

  userNameField() {
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
        initialValue: _viewModel.userName,
        textAlign: TextAlign.start,
        cursorColor: Colors.black54,
        keyboardType: TextInputType.text,
        maxLength: Constants.defaultLength,
        style: Styles().textFormStyle(),
        decoration: InputDecoration(
          counterText: '',
          hintText: Strings.userName,
          hintStyle: GoogleFonts.poppins(
            color: Colors.grey.shade500,
            fontSize: Constants.mediumFontSize,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(Constants.mediumSpacing)
        ),
        onChanged: (String newVal) {
          _viewModel.setUserName(newVal);
        },
      ),
    );
  }

  mobileNumberLabel() {
    return Row(
      children: [
        Text(
          Strings.mobileNumber,
          style: Styles().labelStyle(),
        ),
        const SizedBox(
          width: Constants.extraSmallSpacing,
        ),
      ],
    );
  }

  mobileNumberField() {
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
        initialValue: _viewModel.mobileNumber,
        textAlign: TextAlign.start,
        cursorColor: Colors.black54,
        keyboardType: TextInputType.number,
        maxLength: Constants.defaultLength,
        style: Styles().textFormStyle(),
        decoration: InputDecoration(
            counterText: '',
            hintText: Strings.mobileNumber,
            hintStyle: GoogleFonts.poppins(
              color: Colors.grey.shade500,
              fontSize: Constants.mediumFontSize,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(Constants.mediumSpacing)
        ),
        onChanged: (String newVal) {
          _viewModel.setMobileNumber(newVal);
        },
      ),
    );
  }

  addressLabel() {
    return Row(
      children: [
        Text(
          Strings.address,
          style: Styles().labelStyle(),
        ),
        const SizedBox(
          width: Constants.extraSmallSpacing,
        ),
      ],
    );
  }

  addressField() {
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
        initialValue: _viewModel.address,
        textAlign: TextAlign.start,
        cursorColor: Colors.black54,
        keyboardType: TextInputType.streetAddress,
        maxLength: Constants.defaultLength,
        style: Styles().textFormStyle(),
        decoration: InputDecoration(
            counterText: '',
            hintText: Strings.address,
            hintStyle: GoogleFonts.poppins(
              color: Colors.grey.shade500,
              fontSize: Constants.mediumFontSize,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(Constants.mediumSpacing)
        ),
        onChanged: (String newVal) {
          _viewModel.setAddress(newVal);
        },
      ),
    );
  }

  submitButton() {
    return SizedBox(
      width: MediaQuery.of(_context).size.width,
      height: Constants.extraSmallHeight,
      child: ElevatedButton(
        style: Styles().elevatedButtonPrimary(),
        child: Center(
            child: Text(
              Strings.submit,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w500
              ),
            )
        ),
        onPressed: () {
          _viewModel.submitUserInfo();
        },
      ),
    );
  }
}
