// generic_button.dart
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../styles/app_text_styles.dart';
import 'generic_text.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double? width;
  final bool loadingState;
  final bool autoFocus;
  final EdgeInsetsGeometry? padding;

  const CommonButton({
    Key? key,
    required this.text,
    this.width,
    this.onPressed,
    this.backgroundColor = AppColors.kPrimaryColor,
    this.textColor = Colors.white,
    this.loadingState = false,
    this.autoFocus = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 2),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          padding: MaterialStateProperty.all(padding),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        autofocus: autoFocus,
        onPressed: onPressed,
        child: loadingState
            ? const GenericText(text: 'Loading...')
            : GenericText(
                text: text,
                style: AppTextStyles.titleText.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                ),
              ),
      ),
    );
  }
}
