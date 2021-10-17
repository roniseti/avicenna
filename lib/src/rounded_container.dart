import 'package:flutter/material.dart';

/// rounded border container
class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    Key? key,
    this.child,
    this.width,
    this.color,
    this.margin,
    this.padding
  }) : super(key: key);

  final Widget? child;
  final double? width;
  final Color? color;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.shadow,
        //     spreadRadius: 2,
        //     blurRadius: 16,
        //     offset: Offset(3, 3),
        //   ),
        // ],
      ),
      margin: margin ?? const EdgeInsets.all(12),
      padding: padding ?? const EdgeInsets.only(left: 24, top: 36, right: 24, bottom: 36),
      child: child,
    );
  }
}