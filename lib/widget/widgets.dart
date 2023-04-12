import 'package:flutter/material.dart';
import 'package:flutter_hud/flutter_hud.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talent_pro_assignment/utils/color_helper.dart';
import 'package:talent_pro_assignment/utils/constants.dart';
import 'package:talent_pro_assignment/utils/strings.dart';

class Widgets {

  appBar(String title) {
    return AppBar(
      title: Text(
        title,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      // backgroundColor: ColorHelper.TRANSPARENT_COLOR,
      // elevation: 0,
    );
  }

  mandatory() {
    return Text(
      Strings.mandatory,
      style: GoogleFonts.poppins(
          color: Colors.red,
          fontSize: Constants.smallFontSize,
          fontWeight: FontWeight.w500
      ),
    );
  }

  progressBar({String label = Strings.pleaseWait}) {
    return HUD(
      progressIndicator: const CircularProgressIndicator(
        color: ColorHelper.primaryColor,
      ),
      opacity: 0.8,
      label: label,
      labelStyle: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: Constants.mediumFontSize,
        decoration: TextDecoration.none
      )
    );
  }

  loadingCentre() {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorHelper.primaryColor,
        backgroundColor: Colors.white,
      ),
    );
  }

  noItem(BuildContext context) {
    double margin = MediaQuery.of(context).size.height / 5;

    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(
              top: margin
          ),
          child: ListTile(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  width: Constants.mediumWidth,
                  height: Constants.mediumHeight,
                  image: AssetImage('assets/images/empty.png'),
                ),
                const SizedBox(
                  height: Constants.standardSpacing,
                ),
                Text(
                  'Nothing to show!',
                  style: GoogleFonts.poppins(),
                ),
                Text(
                  'Please swipe down to refresh',
                  style: GoogleFonts.poppins(),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  dateIcon(BuildContext context) {
    return InkWell(
      child: const Icon(
          Icons.date_range,
          color: ColorHelper.primaryColor
      ),
      onTap: () {},
    );
  }

  timeIcon(BuildContext context) {
    return InkWell(
      child: const Icon(
          Icons.timer_sharp,
          color: ColorHelper.primaryColor
      ),
      onTap: () {},
    );
  }

  Future<DateTime?> showCalender(BuildContext context) async {
    DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000, 1),
        lastDate: DateTime(9000, 1),
        builder: (context, picker) {
          return Theme(
            data: Theme.of(context).copyWith(
              dialogBackgroundColor: Colors.white,
              colorScheme: const ColorScheme.light(
                primary: ColorHelper.primaryColor,
                onPrimary: Colors.white,
                surface: ColorHelper.primaryColor,
                onSurface: Colors.black,
              ),
            ),
            child: picker!,
          );
        }
    );

    return dateTime;
  }

  Future<DateTimeRange?> showRangeCalender(BuildContext context) async {
    DateTimeRange? dateTime = await showDateRangePicker(
        context: context,
        firstDate: DateTime(2000, 1),
        lastDate: DateTime(9000, 1),
        // initialDateRange: DateTimeRange(
        //     start: DateTime(2022, 12, 4),
        //     end: DateTime(2022, 12, 10)
        // ),
        builder: (context, picker) {
          return Theme(
            data: Theme.of(context).copyWith(
              dialogBackgroundColor: Colors.white,
              colorScheme: const ColorScheme.light(
                primary: ColorHelper.primaryColor,
                onPrimary: Colors.white,
                surface: ColorHelper.primaryColor,
                onSurface: Colors.black,
              ),
            ),
            child: picker!,
          );
        }
    );

    print(dateTime);
    return dateTime;
  }

  Future<TimeOfDay?> showCustomTimePicker(BuildContext context) async {
    TimeOfDay? selectedTimeRTL = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: child!,
        );
      },
    );

    return selectedTimeRTL;
  }
}
