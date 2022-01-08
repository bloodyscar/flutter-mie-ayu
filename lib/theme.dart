import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 30.0;

Color backgroundColor1 = Color(0xff222831); // blackwhite
Color backgroundColor2 = Color(0xffFFC334); // yellow
Color primaryTextColor = Color(0xffFFFFFF); // white
Color secondaryTextColor = Color(0xff000000); // black grey
Color boxDescriptionColor = Color(0xff323B48); // box text
Color thirdTextColor = Color(0xffA1A1A1); // grey text


Color darkGreyColor = Color(0xff7C82A1); // dark grey



TextStyle primartyTextStyle = GoogleFonts.ibmPlexSans(color: primaryTextColor);
TextStyle secondaryTextStyle =
    GoogleFonts.ibmPlexSans(color: secondaryTextColor);
TextStyle priceTextStyle = GoogleFonts.ibmPlexSans(color: backgroundColor2);
TextStyle boxDescriptionStyle =
    GoogleFonts.ibmPlexSans(color: boxDescriptionColor);
TextStyle thirdTextStyle = GoogleFonts.ibmPlexSans(color: thirdTextColor);
TextStyle darkGreyTextStyle = GoogleFonts.ibmPlexSans(color: darkGreyColor);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
