import 'package:flutter/material.dart';

class AvicennaCheckBox extends StatelessWidget {
  const AvicennaCheckBox({
    Key? key,
    required this.onChanged,
    required this.value,
    required this.title,
    required this.onTap,
    this.width,
    this.margin,
    this.padding = const EdgeInsets.all(6),
    this.borderRadius = 8,
    this.color = Colors.white,
    this.boxShadow
  }) : super(key: key);

  final void Function(bool?)? onChanged;
  final bool value;
  final String title;
  final void Function() onTap;

  final double? width;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Color color;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: boxShadow
      ),
      child: Material(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onTap,
          child: Padding(
            padding: padding,
            child: Row(
              children: [
                Checkbox(
                  value: value,
                  onChanged: onChanged,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  // fillColor: MaterialStateProperty.all(av.Colors.buttonPrimary),
                ),
                Text(title)
              ],
            )
          )
        )
      )
    );
  }

}