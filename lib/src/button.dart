import 'package:flutter/material.dart';
import 'values.dart';

class AvicennaButton extends StatelessWidget {
  const AvicennaButton({
    Key? key,
    required this.onPressed,
    this.onLongPress,
    required this.text,
    this.color,
    this.textColor,
    this.disabled,
    this.minimumSize
  }) : super(key: key);

  final void Function()? onPressed;
  final void Function()? onLongPress;
  final String text;
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
      child: Text(text, style: TextStyle(
        color: textColor ?? AvicennaColors.white,
        fontSize: 16
      )),
    );
  }

}

enum AvicennaSmallIconButtonSize {
  shrink,
  normal,
}

/// round Button with Icon only
class AvicennaIconButton extends StatelessWidget {
  const AvicennaIconButton({
    Key? key,
    required this.onTap,
    this.tooltip = 'Close',
    this.icon = const Icon(Icons.close),
    this.color = Colors.white
  }) : super(key: key);

  final void Function() onTap;
  final String tooltip;
  final Icon icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child:  Material(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(28),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: icon
          )
        )
      )
    );
  }

}

/// round Button with Icon only
class AvicennaSmallIconButton extends StatelessWidget {
  const AvicennaSmallIconButton({
    Key? key,
    required this.onTap,
    this.tooltip = 'Close',
    required this.icon,
    this.color = Colors.white,
    this.size = AvicennaSmallIconButtonSize.normal,
  }) : super(key: key);

  final void Function() onTap;
  final String tooltip;
  final Icon icon;
  final Color color;
  final AvicennaSmallIconButtonSize size;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child:  Material(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(28),
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(size == AvicennaSmallIconButtonSize.shrink ? 2 : 6),
            child: icon
          )
        )
      )
    );
  }

}
