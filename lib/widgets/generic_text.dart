import 'package:flutter/material.dart';

import '../styles/app_text_styles.dart';

class GenericText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int? maxLines;
  final TextDirection? textDirection;

  const GenericText({
    Key? key,
    required this.text,
    this.style = AppTextStyles.normalText,
    this.textAlign = TextAlign.left,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines,
    this.textDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      textDirection: textDirection,
    );
  }
}
