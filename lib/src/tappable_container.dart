import 'package:flutter/material.dart';

/// Container with tappable ability
class TappableContainer extends StatelessWidget {
  const TappableContainer({
    required this.onTap,
    this.onLongPress,
    required this.child,
    this.width,
    this.margin = const EdgeInsets.only(left: 12, top: 12, right: 12),
    this.padding = const EdgeInsets.all(18),
    this.borderRadius = 8,
    this.color = Colors.white,
    this.boxShadow
  }) : super();

  final void Function()? onTap;
  final void Function()? onLongPress;
  final Widget child;
  final double? width;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Color color;
  final List<BoxShadow>? boxShadow;
  //boxConstrains constrains

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
          onLongPress: onLongPress,
          child: Padding(
            padding: padding,
            child: child
          )
        )
      )
    );
  }
}