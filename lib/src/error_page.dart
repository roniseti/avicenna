import 'package:flutter/material.dart';
import 'values.dart';

/// error page
class AvicennaErrorPage extends StatelessWidget{
  const AvicennaErrorPage({
    Key? key,
    required this.message,
    this.assetPath,
    this.action,
    this.imageWidth = 1
  }) : super(key: key);

  final String message;
  final String? assetPath;
  final Widget? action;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (assetPath != null) Image.asset(assetPath ?? '', width: (MediaQuery.of(context).size.width) * (imageWidth)),
        SizedBox(height: 48, width: MediaQuery.of(context).size.width),
        Text(message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            height: 1.5,
            color: AvicennaColors.thirdBlack,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )
        ),
        const SizedBox(height: 72),
        action ?? const SizedBox()
      ]
    );
  }

}