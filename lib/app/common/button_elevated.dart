import 'package:flutter/material.dart';

class ButtonElevated extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? radius;
  final double? width;
  final double? height;
  final Widget? child;
  final String text;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final double? elevation;
  final BorderSide? side;
  final Size? minimumSize;
  final bool isEnabled;
  final bool textLeftAlign;
  final Clip clipBehavior;

  const ButtonElevated({
    Key? key,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.radius,
    this.width,
    this.height,
    this.child,
    this.text = "",
    this.padding,
    this.textStyle,
    this.elevation,
    this.side,
    this.minimumSize,
    this.isEnabled = true,
    this.textLeftAlign = false,
    this.clipBehavior = Clip.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isEnabled,
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          clipBehavior: clipBehavior,
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: foregroundColor ?? Colors.black,
            backgroundColor: isEnabled ? backgroundColor : backgroundColor?.withOpacity(0.4),
            alignment: textLeftAlign ? Alignment.centerLeft : Alignment.center,
            elevation: isEnabled ? elevation : 0,
            side: side,
            minimumSize: minimumSize,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 4),
            ),
            padding: padding,
          ),
          child: child ??
              Text(
                text,
                overflow: TextOverflow.ellipsis,
                // style: textStyle ?? context.theme.textTheme.heading5Light,
                maxLines: 1,
                textAlign: textLeftAlign ? TextAlign.left : TextAlign.center,
              ),
        ),
      ),
    );
  }
}