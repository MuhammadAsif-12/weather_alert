
import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {
  const PrimaryText({
    super.key,
    this.text = "",
    this.size,
    this.textColor,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.height,
    this.letterSpacing,
    this.underline = false,
  });

  final String text;
  final double? size;
  final Color? textColor;
  final FontWeight fontWeight;
  final double? height;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;
  final double? letterSpacing;
  final bool underline;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    final double defaultLetterSpacing = letterSpacing ?? 0.0;

    return Text(
      text,
      overflow: overflow,
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
      style: theme.textTheme.bodySmall?.copyWith(
        fontSize: size,
        height: height,
        color: textColor ?? theme.colorScheme.onBackground,
        fontWeight: fontWeight,
        letterSpacing: defaultLetterSpacing,
        decoration: underline ? TextDecoration.underline : TextDecoration.none,
      ),
    );
  }
}
