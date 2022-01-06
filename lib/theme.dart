import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 30.0;

Color backgroundColor1 = Color(0xff222831); // blackwhite
Color backgroundColor2 = Color(0xffFFC334); // yellow
Color primaryTextColor = Color(0xffFFFFFF); // white
Color secondaryTextColor = Color(0xff000000); // black grey
Color boxDescriptionColor = Color(0xff323B48); // box text
Color thirdTextColor = Color(0xffA1A1A1); // grey text

TextStyle primartyTextStyle = GoogleFonts.poppins(color: primaryTextColor);
TextStyle secondaryTextStyle = GoogleFonts.poppins(color: secondaryTextColor);
TextStyle priceTextStyle = GoogleFonts.poppins(color: backgroundColor2);
TextStyle boxDescriptionStyle = GoogleFonts.poppins(color: boxDescriptionColor);
TextStyle thirdTextStyle = GoogleFonts.poppins(color: thirdTextColor);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
