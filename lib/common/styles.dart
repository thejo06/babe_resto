import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color blackColor = Color(0xFF000000);
Color whiteColor = Color(0xFFFFFFFF);
Color redColor = Color(0xFFF54749);
Color greyColor = Color(0xFF585858);
Color yellowColor = Color(0xFFFCCC74);

double defaultPadding = 16.0;

TextStyle headingText = GoogleFonts.poppins(fontWeight: bold, fontSize: 25);
TextStyle headingText2 =
    GoogleFonts.lobster(fontWeight: extraBold, fontSize: 30);
TextStyle titleText1 =
    GoogleFonts.poppins(fontWeight: semiBold, fontSize: 24, color: blackColor);
TextStyle titleText2 =
    GoogleFonts.poppins(fontWeight: medium, fontSize: 17, color: blackColor);
TextStyle titleTextListResto =
    GoogleFonts.poppins(fontSize: 15, color: blackColor);
TextStyle subtitleTextListResto =
    GoogleFonts.poppins(fontSize: 12, color: greyColor);
TextStyle subtitleText = GoogleFonts.poppins(color: greyColor);
TextStyle bodyTextDescription =
    GoogleFonts.poppins(fontSize: 12, color: greyColor);
TextStyle titleTextMenu =
    GoogleFonts.lobster(fontSize: 18, color: greyColor, fontWeight: bold);
TextStyle bodyTextMenu =
    GoogleFonts.poppins(fontSize: 15, color: whiteColor, fontWeight: semiBold);
TextStyle ratingText =
    GoogleFonts.poppins(fontSize: 12, color: whiteColor, fontWeight: medium);

FontWeight light = FontWeight.w300;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
