import 'package:flutter/material.dart';

import '../../theme/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.padding,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius ?? 20),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: padding ?? const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 20),
          color: backgroundColor ?? Theme.of(context).primaryColor,
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.heading2.copyWith(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
