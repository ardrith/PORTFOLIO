import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PixelText extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign textAlign;

  const PixelText(
    this.text, {
    super.key,
    this.fontSize = 32,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    const colors = [
      Color(0xFFFF0055), // Arcade Pink/Red
      Color(0xFF00FFCC), // Arcade Cyan
      Color(0xFFFFCC00), // Arcade Yellow
      Color(0xFF00FF00), // Arcade Lime
      Color(0xFFCC00FF), // Arcade Magenta
    ];

    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: List.generate(text.length, (index) {
          return TextSpan(
            text: text[index],
            style: GoogleFonts.vt323(
                fontSize: fontSize,
                height: 1.2,
                fontWeight: FontWeight.bold,
                color: text[index] == ' '
                    ? Colors.transparent
                    : colors[index % colors.length],
                shadows: const [
                  // Hard pixel shadow effect
                  Shadow(color: Colors.white24, offset: Offset(0.5, 0.5)),
                ]),
          );
        }),
      ),
    );
  }
}
