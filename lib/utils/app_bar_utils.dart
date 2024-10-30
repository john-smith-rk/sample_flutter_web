import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

PreferredSizeWidget getAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Theme.of(context).primaryColor,
    title: Text(title, style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontFamily: GoogleFonts.aboreto().fontFamily ),),
  );
}

TextStyle? getAppBarTextStyle(BuildContext context){
  return Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontFamily: GoogleFonts.aboreto().fontFamily );
}

Color getAppBarBgColor(BuildContext context){
  return Theme.of(context).primaryColor;
}

