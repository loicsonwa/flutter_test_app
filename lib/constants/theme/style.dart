import 'package:flutter/material.dart';

import 'color.dart';

TextStyle appBarTitleStyle(BuildContext context) => Theme.of(context).textTheme.titleLarge!.copyWith(
      color: primary,
      fontWeight: FontWeight.normal,
    );

// Additional text themes
TextStyle boldCaptionStyle(BuildContext context) =>
    Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold);

TextStyle boldSubtitle(BuildContext context) => Theme.of(context).textTheme.titleMedium!.copyWith(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

TextStyle loginButtonTextStyle(BuildContext context) =>
    Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.black);

TextStyle normalCaptionStyle(BuildContext context) => Theme.of(context).textTheme.bodySmall!.copyWith(
      color: Colors.grey,
      fontSize: 14,
    );

TextStyle normalHeadingStyle(BuildContext context) =>
    Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.normal,
        );

TextStyle textFieldHintStyle(BuildContext context) => Theme.of(context).textTheme.bodySmall!.copyWith(
      color: Colors.grey[500],
      fontWeight: FontWeight.normal,
      fontSize: 15,
    );

TextStyle textFieldInputStyle(BuildContext context, FontWeight? fontWeight) =>
    Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: black,
          fontSize: 18,
          fontWeight: fontWeight ?? FontWeight.normal,
        );

TextStyle textFieldLabelStyle(BuildContext context) =>
    Theme.of(context).textTheme.bodySmall!.copyWith(
          color: secondary,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        );

TextStyle textFieldSuffixStyle(BuildContext context) =>
    Theme.of(context).textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        );

const prodRegular = TextStyle(
  fontFamily: 'Google-Sans',
  fontWeight: FontWeight.w400,
  fontSize: 15,
  color: black,
);

const prodMedium = TextStyle(
  fontFamily: 'Google-Sans',
  fontWeight: FontWeight.w500,
  fontSize: 15,
  color: black,
);

const prodBold = TextStyle(
  fontFamily: 'Google-Sans',
  fontWeight: FontWeight.w700,
  fontSize: 15,
  color: black,
);

const prodBlack = TextStyle(
  fontFamily: 'Google-Sans',
  fontWeight: FontWeight.w900,
  fontSize: 15,
  color: black,
);

class ThemeUtils {
  static final ThemeData defaultAppThemeData = appTheme();

  static ThemeData appTheme() {
    // Color primaryColor = Color(0xffFF0000);
    Color primaryColor = primary;

    return ThemeData(
      fontFamily: "Google-Sans",
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: secondary.withOpacity(0.4),
      ),
      hintColor: const Color(0xFF999999),
      // Widget theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: const Color(0xffFFFFFF),
          disabledBackgroundColor: const Color(0xff707070), // Disabled button color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: primaryColor),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: primaryColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        elevation: 5.0,
        unselectedIconTheme: IconThemeData(color: Colors.grey[600]),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(primaryColor),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: primaryColor,
        textTheme: ButtonTextTheme.primary,
        shape: const StadiumBorder(),
        disabledColor: const Color(0xFFE5E3DC),
        height: 50,
      ),
      sliderTheme: SliderThemeData(
        thumbColor: primaryColor,
        activeTrackColor: primaryColor,
      ),
      cardColor: white,
      cardTheme: const CardTheme(elevation: 5),
      appBarTheme: const AppBarTheme(
        color: white,
        elevation: 0,
        iconTheme: IconThemeData(color: black),
      ),
      iconTheme: IconThemeData(
        color: primaryColor,
        opacity: 1.0,
      ),
      textTheme: const TextTheme(
        headline5: TextStyle(
          fontWeight: FontWeight.w900,
          color: black,
        ),
        headline6: TextStyle(
          fontWeight: FontWeight.bold,
          color: black,
        ),
        subtitle1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: black,
        ),
        subtitle2: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: black,
        ),
        bodyText2: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        caption: TextStyle(
          fontSize: 13,
          color: black,
        ),
        bodyText1: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
        button: TextStyle(
          fontWeight: FontWeight.bold,
          color: white,
          fontSize: 15,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        // ignore: unnecessary_const
        // focusedBorder: const UnderlineInputBorder(
        //   borderSide: BorderSide(
        //     width: 2.0,
        //     color: Colors.transparent,
        //   ),
        // ),
        // enabledBorder: UnderlineInputBorder(
        //   borderSide: BorderSide(
        //     width: 0.7,
        //     color: Colors.transparent,
        //   ),
        // ),
        contentPadding: EdgeInsets.only(top: 10, left: 10, right: 10),
        hintStyle: TextStyle(
          fontSize: 15,
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
