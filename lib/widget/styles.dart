import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talent_pro_assignment/utils/color_helper.dart';
import 'package:talent_pro_assignment/utils/constants.dart';

class Styles {

  labelStyle() {
    return GoogleFonts.poppins(
        fontSize: Constants.smallFontSize,
        fontWeight: FontWeight.w500
    );
  }

  hintTextStyle() {
    return GoogleFonts.poppins(
      color: Colors.grey.shade500,
      fontSize: Constants.mediumFontSize,
    );
  }

  textFormStyle() {
    return GoogleFonts.poppins(
      color: Colors.black,
      fontSize: Constants.mediumFontSize,
    );
  }

  elevatedButtonPrimary() {
    return ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Constants.extraSmallRadius)
        ),
        backgroundColor: ColorHelper.primaryDarkColor
    );
  }

  elevatedButtonWhite() {
    return ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Constants.extraSmallRadius)
        ),
        backgroundColor: Colors.white
    );
  }

  textFormDecoration(String hintText) {
    return InputDecoration(
      counterText: '',
      border: InputBorder.none,
      contentPadding: const EdgeInsets.all(Constants.mediumSpacing),
      hintText: hintText,
      hintStyle: GoogleFonts.poppins(
        color: Colors.grey.shade500,
        fontSize: Constants.mediumFontSize,
      ),
    );
  }

  smallGreyTextStyle({bool isBold = false}) {
    return GoogleFonts.poppins(
        color: Colors.grey,
        fontSize: Constants.smallFontSize,
        fontWeight: isBold ? FontWeight.w600 : FontWeight.w500
    );
  }

  smallBlackTextStyle({bool isBold = false}) {
    return GoogleFonts.poppins(
        color: Colors.black,
        fontSize: Constants.smallFontSize,
        fontWeight: isBold ? FontWeight.w600 : FontWeight.w500
    );
  }

  smallWhiteTextStyle({bool isBold = false}) {
    return GoogleFonts.poppins(
        color: Colors.white,
        fontSize: Constants.smallFontSize,
        fontWeight: isBold ? FontWeight.w600 : FontWeight.w500
    );
  }

  mediumBlackTextStyle({bool isBold = false}) {
    return GoogleFonts.poppins(
        color: Colors.black,
        fontSize: Constants.mediumFontSize,
        fontWeight: isBold ? FontWeight.w600 : FontWeight.w500
    );
  }

  mediumWhiteTextStyle({bool isBold = false}) {
    return GoogleFonts.poppins(
        color: Colors.white,
        fontSize: Constants.mediumFontSize,
        fontWeight: isBold ? FontWeight.w600 : FontWeight.w500
    );
  }

  largeBlackTextStyle({bool isBold = false}) {
    return GoogleFonts.poppins(
        color: Colors.black,
        fontSize: Constants.largeFontSize,
        fontWeight: isBold ? FontWeight.w600 : FontWeight.w500
    );
  }

  largeWhiteTextStyle({bool isBold = false}) {
    return GoogleFonts.poppins(
        color: Colors.white,
        fontSize: Constants.largeFontSize,
        fontWeight: isBold ? FontWeight.w600 : FontWeight.w500
    );
  }
}
