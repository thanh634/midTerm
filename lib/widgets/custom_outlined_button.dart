import 'package:flutter/material.dart';
import '../core/app_export.dart';
import 'base_button.dart';

class CustomOutlinedButton extends BaseButton {
  const CustomOutlinedButton({
    Key? key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    this.label,
    this.isActive = false,
    this.onTap,
    super.onPressed,
    super.buttonStyle,
    super.buttonTextStyle,
    super.isDisabled,
    super.alignment,
    super.height,
    super.width,
    super.margin,
    required super.text
  });

  final BoxDecoration? decoration;

  final Widget? leftIcon;
  final Widget? rightIcon;
  final Widget? label;
  final bool isActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        decoration: BoxDecoration(
          border: Border.all(
            color: isActive
                ? theme.colorScheme.primary
                : theme.colorScheme.onSurface,
          ),
          borderRadius: BorderRadius.circular(8),
          color: isActive ? theme.colorScheme.primary.withOpacity(0.2) : null,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: theme.textTheme.titleSmall?.copyWith(
            color: isActive
                ? theme.colorScheme.primary
                : theme.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}