import 'dart:math';
import 'dart:ui' show Color;

import 'package:flutter/material.dart';
import 'values.dart';

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
  return '${timestamp.hour}:${timestamp.minute}';
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

class FullScreenDialog extends StatelessWidget {
  const FullScreenDialog({
    Key? key,
    required this.title,
    required this.content
  }) : super(key: key);

  final String title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AvicennaColors.background,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black
        ),
        centerTitle: true,
        title: Text(title ,style: const TextStyle(
            color: Colors.black
        )),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.white
      ),
      body: content
    );
  }
}

class Modal extends StatelessWidget {
  const Modal({
    Key? key,
    this.child,
    this.insetPadding,
  }) : super(key: key);

  final Widget? child;
  final EdgeInsets? insetPadding;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: child ?? const SizedBox(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      insetPadding: insetPadding ?? EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 3.4, left: 16, right: 16),
      contentPadding: EdgeInsets.zero,
    );
  }
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
