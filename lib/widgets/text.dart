import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CairoText extends StatelessWidget {
  const CairoText({super.key, required this.text, this.style});
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.cairo(textStyle: style),
    );
  }
}