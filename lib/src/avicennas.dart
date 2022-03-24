import 'dart:math';

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
  return timestamp.hour.toString().padLeft(2, '0') + ':' + timestamp.minute.toString().padLeft(2, '0');
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

class AvicennaFullScreenDialog extends StatelessWidget {
  const AvicennaFullScreenDialog({
    Key? key,
    required this.title,
    required this.content,
    this.backgroundColor = AvicennaColors.lightBackground,
  }) : super(key: key);

  final String title;
  final Widget content;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black
        ),
        // centerTitle: true,
        title: Text(title, style: const TextStyle(
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

enum AvicennaSmallIconButtonSize {
  shrink,
  normal,
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
