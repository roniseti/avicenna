import 'package:flutter/material.dart';
import 'values.dart';

class AvicennaButton extends StatelessWidget {
  const AvicennaButton({
    Key? key,
    required this.onPressed,
    this.onLongPress,
    this.text,
    this.color,
    this.textColor,
    this.disabled,
    this.minimumSize
  }) : super(key: key);

  final void Function()? onPressed;
  final void Function()? onLongPress;
  final String? text;
  final Color? color;
  final Color? textColor;
  final bool? disabled;
  final Size? minimumSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled == true ? null : onPressed,
      onLongPress: disabled == true ? null : onLongPress,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(
          const EdgeInsets.only(left: 18, right: 18)
        ),
        minimumSize: MaterialStateProperty.all(
          minimumSize ?? const Size(144, 48)
        ),
        backgroundColor: MaterialStateProperty.all(disabled == true ? AvicennaColors.disabledButton : color ?? AvicennaColors.buttonPrimary),
        shadowColor: MaterialStateProperty.all(const Color(0x301A77AD)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            // side: BorderSide(color: Colors.buttonOutlinePrimary)
          )
        )
      ),
      child: Text(text!, style: TextStyle(
        color: textColor ?? AvicennaColors.white,
        fontSize: 16
      )),
    );
  }

}