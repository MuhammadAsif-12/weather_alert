import 'package:weather_home_screen/constant/common/texts.dart';
import 'package:marquee/marquee.dart';
import 'dart:ui';
import 'package:flutter/material.dart';

class MarqueeText extends StatelessWidget {
  final String text;
  final double thresholdWidth;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  final double blankSpace;

  const MarqueeText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.size = 14.0,
    this.fontWeight = FontWeight.w500,
    this.blankSpace = 20.0,
    this.thresholdWidth = 100.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: size,
          fontWeight: fontWeight,
        ),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    final double textWidth = textPainter.size.width;

    if (textWidth > thresholdWidth) {
      // Apply Marquee effect
      return Marquee(
        text: text,
        fadingEdgeEndFraction: 0.1,
        fadingEdgeStartFraction: 0.1,
        style: TextStyle(
          fontSize: size,
          letterSpacing: -0.3,
          fontWeight: fontWeight,
          color: color,
        ),
        blankSpace: blankSpace,
      );
    } else {
      // Return normal Text widget
      return PrimaryText(
        text: text,
        textAlign: TextAlign.start,
        size: size,
        maxLines: 1,
        fontWeight: fontWeight,
        textColor: color,
        letterSpacing: -0.3,
      );
    }
  }
}