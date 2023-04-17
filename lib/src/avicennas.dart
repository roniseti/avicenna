import 'dart:math';

import 'package:flutter/material.dart';

/// converting String or number to comma separated String value
String moneyFormat(dynamic intPrice) {
  var price = intPrice.toString();
  if (price.length > 2) {
    var value = price;
    value = value.replaceAll(RegExp(r'\D'), '');
    value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
    return value;
  } else {
    return price;
  }
}

String formatTime(DateTime timestamp) {
  return '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
}

String generateRandomString({required int len, String chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890'}) {
  var r = Random();
  // const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
}

class TitleText extends StatelessWidget {
  const TitleText(
    this.text, {
    Key? key
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600
      ),
    );
  }
}

// class Modal extends StatelessWidget {
//   const Modal({
//     Key? key,
//     this.child,
//     this.insetPadding,
//   }) : super(key: key);

//   final Widget? child;
//   final EdgeInsets? insetPadding;

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       content: child ?? const SizedBox(),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       insetPadding: insetPadding ?? EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 3.4, left: 16, right: 16),
//       contentPadding: EdgeInsets.zero,
//     );
//   }

// }
