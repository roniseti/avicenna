import 'package:flutter/material.dart';
import 'values.dart';

enum AvicennaChipSize {
  shrink, small, medium, large
}
/// Actually there's already material chip
class AvicennaChip extends StatelessWidget {
  const AvicennaChip({
    Key? key,
    this.text,
    this.onPressed,
    this.textColor,
    this.color,
    this.size,
    this.borderRadius = 14,
    this.child,
  }) : super(key: key);

  final String? text;
  final void Function()? onPressed;
  final Color? textColor;
  final Color? color;
  final AvicennaChipSize? size;
  final double borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    double multiplier = size == AvicennaChipSize.large ? 1.5 : size == AvicennaChipSize.medium ? 1.2 : 1;
    double height = size == AvicennaChipSize.shrink ? 22 : 28;
    double padding = size == AvicennaChipSize.shrink ? 8 : 12;
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: MaterialStateProperty.all(
          EdgeInsets.only(left: padding * multiplier, right: padding * multiplier)
        ),
        minimumSize: MaterialStateProperty.all(
          Size(28 * multiplier, height * multiplier)
        ),
        backgroundColor: MaterialStateProperty.all(color ?? AvicennaColors.label),
        shadowColor: MaterialStateProperty.all(const Color(0x301A77AD)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius * multiplier),
            // side: BorderSide(color: Colors.labelOutline)
          )
        )
      ),
      onPressed: onPressed,
      child: child ?? Text(text!, style: TextStyle(
        color: textColor ?? AvicennaColors.labelText,
        fontSize: 12 * multiplier,
        // fontStyle: FontStyle.italic
      )),
    );
  }

}