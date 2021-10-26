import 'package:flutter/material.dart';
import 'values.dart';

/// Actually there's already material chip
class AvicennaChip extends StatelessWidget {
  const AvicennaChip({
    Key? key,
    this.text,
    this.onPressed,
    this.textColor,
    this.color
  }) : super(key: key);

  final String? text;
  final void Function()? onPressed;
  final Color? textColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: MaterialStateProperty.all(
          const EdgeInsets.only(left: 12, right: 12)
        ),
        minimumSize: MaterialStateProperty.all(
          const Size(28, 28)
        ),
        backgroundColor: MaterialStateProperty.all(color ?? AvicennaColors.label),
        shadowColor: MaterialStateProperty.all(const Color(0x301A77AD)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            // side: BorderSide(color: Colors.labelOutline)
          )
        )
      ),
      onPressed: onPressed,
      child: Text(text!, style: TextStyle(
        color: textColor ?? AvicennaColors.labelText,
        fontSize: 12,
        // fontStyle: FontStyle.italic
      )),
    );
  }

}