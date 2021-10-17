import 'package:flutter/material.dart';
import 'values.dart' as av;

/// error page
class ErrorPage extends StatelessWidget{
  const ErrorPage({
    Key? key,
    required this.message,
    this.assetPath = 'assets/images/empty.png',
    this.action,
    this.imageWidth = 1
  }) : super(key: key);

  final String message;
  final String assetPath;
  final Widget? action;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(assetPath, width: (MediaQuery.of(context).size.width) * (imageWidth)),
        SizedBox(height: 48, width: MediaQuery.of(context).size.width),
        Text(message,
          textAlign: TextAlign.center,
          style: TextStyle(
            height: 1.5,
            color: av.Colors.thirdBlack,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )
        ),
        SizedBox(height: 72),
        action ?? SizedBox()
      ]
    );
  }

}