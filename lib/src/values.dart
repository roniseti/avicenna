import 'package:flutter/material.dart';

enum AvicennaTextFieldStyle {
  filled, border
}

class AvicennaColors {
  AvicennaColors._();

  static const Color transparent = Color(0x00FFFFFF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color danger = Color(0xFFFA2340);
  static const Color semiDanger = Color(0xFFEE4D48);
  static const Color softDanger = Color(0xFFFFDBE0);
  static const Color buttonPrimary = Color(0xFF1EA6FC);
  // static const Color buttonOutlinePrimary = Color(0xFF1E9FEB);
  static const Color label = Color(0xFFDCF2FF);
  static const Color labelText = buttonPrimary; //Color(0xFF1EA6FC);
  static const Color labelOrange = Color(0xFFFFF3DC);
  static const Color labelTextOrange = Color(0xFFF0A613);
  static const Color labelGreen = Color(0xFFDCFFE1);
  static const Color labelTextGreen = Color(0xFF15D435);


  static const Color disabledButton = Color(0xFFDCDEE0);

  // static const Color labelOutline = Color(0xFF73CCFF);
  static const Color lightBackground = Color(0xFFF7F8FA);
  static const Color background = Color(0xFFEBEDF0);
  static const Color shadow = Color(0xFFDCDEE0);
  static const Color black = Color(0xFF121212);
  static const Color secondBlack = Color(0xFF9D9D9D);
  static const Color grey = Color(0xFFC0C5CA);
  static const Color thirdBlack = Color(0xFF7A7A7A);

  static const Color bluetoothBlue = Color(0xFF0082FC);

  static const Color textFieldBorder = Color(0xFFD9D9D9);
  static const Color textFieldFill = Color(0xFFEFEFEF);
  static const Color textFieldFillDisabled = Color(0xFFE0E0E0);
}

class AvicennaProps {
  AvicennaProps._();

  static var boxShadow = [
    BoxShadow(
      color: const Color(0xFF363535).withOpacity(0.16),
      spreadRadius: 0,
      blurRadius: 10,
      offset: const Offset(0, 8),
    ),
  ];

  static var boxShadowSoftEqual = [
    BoxShadow(
      color: const Color(0xFF193148).withOpacity(0.1),
      spreadRadius: 0,
      blurRadius: 4,
      offset: const Offset(0, 0),
    )
  ];

  static var boxShadowEqual = [
    BoxShadow(
      color: const Color(0xFF193148).withOpacity(0.16),
      spreadRadius: 0,
      blurRadius: 6,
      offset: const Offset(0, 0),
    )
  ];

  static var boxShadowSoft = [
    BoxShadow(
      color: const Color(0xFF363535).withOpacity(0.1),
      spreadRadius: 0,
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];

  static var boxShadowVerySoft = [
    BoxShadow(
      color: const Color(0xFF363535).withOpacity(0.1),
      spreadRadius: 0,
      blurRadius: 2,
      offset: const Offset(0, 1),
    ),
  ];

  static var boxShadowInverted = [
    BoxShadow(
      color: const Color(0xFF363535).withOpacity(0.16),
      spreadRadius: 0,
      blurRadius: 10,
      offset: const Offset(8, 0),
    ),
  ];

  static var boxShadowUltraSoft = [
    BoxShadow(
      color: const Color(0xFF56939A).withOpacity(0.10),
      spreadRadius: 0,
      blurRadius: 10,
      offset: const Offset(0, 0),
    ),
  ];

}