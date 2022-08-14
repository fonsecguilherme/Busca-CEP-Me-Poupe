import 'package:flutter/material.dart';

class Style {
  static const String poppins = "Poppins";
  static const String inter = "Inter";
  static const String hind = "Hind";

  static const textSize10 = 10.0;
  static const textSize12 = 12.0;
  static const textSize13 = 13.0;
  static const textSize15 = 15.0;
  static const textSize16 = 16.0;
  static const textSize18 = 18.0;
  static const textSize19 = 19.0;
  static const textSize27 = 27.0;
  static const textSize60 = 60.0;

  static const purpleColor = Color(0XFF6D51FF);
  static const darkerPurpleColor = Color(0XFF2E179D);
  static const whiteColor = Colors.white;
  static const greyColor = Colors.grey;
  static const darkGreyColor = Color(0XFF595959);
  static const blackColor = Colors.black;
  static const lightLilacColor = Color(0XFFF6F4FF);
  static const homeSavedZipsTxtColor = Color(0XFF7B61FF);
  static const backgroundColor = Color.fromARGB(255, 169, 157, 231);

  static const TextStyle largerTextStyleWhite = TextStyle(
    fontFamily: poppins,
    fontWeight: FontWeight.w600,
    fontSize: textSize27,
    color: whiteColor,
  );

  static const largerTextStyleBlack = TextStyle(
    fontFamily: poppins,
    fontWeight: FontWeight.w600,
    fontSize: textSize27,
    color: blackColor,
  );

  static const largerTextStylePurple = TextStyle(
    fontFamily: poppins,
    fontWeight: FontWeight.w600,
    fontSize: textSize27,
    color: purpleColor,
  );

  static const bottomAppBarFontPurple = TextStyle(
    fontFamily: poppins,
    fontWeight: FontWeight.w500,
    fontSize: textSize10,
    color: purpleColor,
  );

  static const bottomAppBarFontGrey = TextStyle(
    fontFamily: poppins,
    fontWeight: FontWeight.w500,
    fontSize: textSize10,
    color: Colors.grey,
  );

  static const homePageCepSearchBar = TextStyle(
    fontFamily: poppins,
    fontWeight: FontWeight.w600,
    fontSize: textSize15,
    color: purpleColor,
  );

  static const addressItemText01 = TextStyle(
    fontFamily: poppins,
    fontWeight: FontWeight.w400,
    fontSize: textSize13,
    color: greyColor,
  );

  static const addressItemText02 = TextStyle(
    fontFamily: poppins,
    fontWeight: FontWeight.w500,
    fontSize: textSize15,
    color: darkGreyColor,
  );

  static const homeCircleText01 = TextStyle(
    fontFamily: inter,
    fontWeight: FontWeight.w500,
    fontSize: textSize60,
    color: whiteColor,
  );
  static const homeCircleText02 = TextStyle(
    fontFamily: inter,
    fontWeight: FontWeight.w400,
    fontSize: textSize12,
    color: whiteColor,
  );

  static const homeSavedZipsText = TextStyle(
    fontFamily: poppins,
    fontWeight: FontWeight.w600,
    fontSize: textSize15,
    color: homeSavedZipsTxtColor,
  );

  static const searcBarText01 = TextStyle(
    fontFamily: poppins,
    fontWeight: FontWeight.w500,
    fontSize: textSize18,
    color: whiteColor,
  );

  static const searcBarCounter = TextStyle(
    fontFamily: poppins,
    fontWeight: FontWeight.w400,
    fontSize: textSize13,
    color: whiteColor,
  );

  static const resultNetwork01 = TextStyle(
    fontFamily: poppins,
    fontWeight: FontWeight.w500,
    fontSize: textSize19,
    color: purpleColor,
  );
  static const resultNetwork02 = TextStyle(
    fontFamily: poppins,
    fontWeight: FontWeight.w400,
    fontSize: textSize15,
    color: blackColor,
  );

  static const addFavoritesBar = TextStyle(
    fontFamily: hind,
    fontWeight: FontWeight.w500,
    fontSize: textSize16,
    color: whiteColor,
  );
}
