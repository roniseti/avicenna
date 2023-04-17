import 'package:flutter/material.dart';
import 'values.dart';

/// error page
class AvicennaErrorPage extends StatelessWidget{
  const AvicennaErrorPage({
    Key? key,
    required this.message,
    this.assetPath,
    this.action,
    this.imageWidth = 1,
    this.imageToTitlePadding = 36,
    this.titleToActionPadding = 72,
    this.titleStyle = const TextStyle(
      height: 1.5,
      color: AvicennaColors.thirdBlack,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    )
  }) : super(key: key);

  final String message;
  final String? assetPath;
  final Widget? action;
  final double imageWidth;
  final double imageToTitlePadding;
  final double titleToActionPadding;
  final TextStyle titleStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (assetPath != null) Image.asset(assetPath ?? '', width: (MediaQuery.of(context).size.width) * (imageWidth)),
        SizedBox(height: imageToTitlePadding, width: MediaQuery.of(context).size.width),
        Text(message,
          textAlign: TextAlign.center,
          style: titleStyle
        ),
        SizedBox(height: titleToActionPadding),
        action ?? const SizedBox()
      ]
    );
  }

}