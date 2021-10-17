import 'package:flutter/material.dart';
import 'values.dart' as av;

class Button extends StatelessWidget {
  const Button({
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
          EdgeInsets.only(left: 18, right: 18)
        ),
        minimumSize: MaterialStateProperty.all(
          minimumSize ?? Size(144, 48)
        ),
        backgroundColor: MaterialStateProperty.all(disabled == true ? av.Colors.disabledButton : color ?? av.Colors.buttonPrimary),
        shadowColor: MaterialStateProperty.all(Color(0x301A77AD)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            // side: BorderSide(color: Colors.buttonOutlinePrimary)
          )
        )
      ),
      child: Text(text!, style: TextStyle(
        color: textColor ?? av.Colors.white,
        fontSize: 16
      )),
    );
  }
}