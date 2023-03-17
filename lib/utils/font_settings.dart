import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontSettings {
  static TextStyle primaryFont =
      GoogleFonts.jura(textStyle: TextStyle(color: Colors.white, letterSpacing: .5), fontWeight: FontWeight.w700);

  static TextStyle secondaryFont = GoogleFonts.justAnotherHand(
    textStyle: TextStyle(color: Colors.white, letterSpacing: .5),
  );
}
