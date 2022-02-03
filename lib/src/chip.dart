import 'package:flutter/material.dart';
import 'values.dart';

enum AvicennaChipSize {
  small, medium, large
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
  }) : super(key: key);

  final String? text;
  final void Function()? onPressed;
  final Color? textColor;
  final Color? color;
  final AvicennaChipSize? size;

  @override
  Widget build(BuildContext context) {
    double multiplier = size == AvicennaChipSize.large ? 1.5 : size == AvicennaChipSize.medium ? 1.25 : 1;
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: MaterialStateProperty.all(
          EdgeInsets.only(left: 12 * multiplier, right: 12 * multiplier)
        ),
        minimumSize: MaterialStateProperty.all(
          Size(28 * multiplier, 28 * multiplier)
        ),
        backgroundColor: MaterialStateProperty.all(color ?? AvicennaColors.label),
        shadowColor: MaterialStateProperty.all(const Color(0x301A77AD)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14 * multiplier),
            // side: BorderSide(color: Colors.labelOutline)
          )
        )
      ),
      onPressed: onPressed,
      child: Text(text!, style: TextStyle(
        color: textColor ?? AvicennaColors.labelText,
        fontSize: 12 * multiplier,
        // fontStyle: FontStyle.italic
      )),
    );
  }

}