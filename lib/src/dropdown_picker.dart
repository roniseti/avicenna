import 'package:flutter/material.dart';
import 'values.dart';

/// if using the decoration, please add this
///   contentPadding: EdgeInsets.only(left: 16, right: 16),
///   border: InputBorder.none
class AvicennaDropDownPicker extends StatelessWidget {
  const AvicennaDropDownPicker({
    Key? key,
    required this.items,
    required this.title,
    this.hint,
    this.initialValue,
    required this.onChanged,
    this.validator,
    this.obscureText = false,
    this.decoration,
    this.enabled = true,
    this.textFieldStyle = TextFieldStyle.filled
  }) : super(key: key);

  final List<String> items;
  final String title;
  final Widget? hint;
  final String? initialValue;
  final Function(String) onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;
  final InputDecoration? decoration;
  final bool enabled;
  final TextFieldStyle textFieldStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(
          color: AvicennaColors.thirdBlack,
          fontWeight: FontWeight.w400
        )),
        const SizedBox(height: 8),
        Container(
          height: 44, // 51.2,
          decoration: BoxDecoration(
            color: enabled
                ? textFieldStyle == TextFieldStyle.filled ? AvicennaColors.textFieldFill : AvicennaColors.white
                : AvicennaColors.textFieldFillDisabled,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: textFieldStyle == TextFieldStyle.filled
                ? null
                : Border.all(width: 1.6, color: AvicennaColors.textFieldBorder),
          ),
          child: DropdownButtonFormField<String>(
            value: initialValue == '' ? null : initialValue,
            hint: hint,
            decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)
              ),
              errorBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 0,
                  top: textFieldStyle == TextFieldStyle.filled ? -4 : -5.6),
              errorStyle: const TextStyle(
                shadows: [
                  Shadow(color: AvicennaColors.danger, offset: Offset(-6, 18))
                ],
                color: Colors.transparent
              )
            ),
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value)
              );
            }).toList(),
            validator: validator,
            onChanged: enabled ? (val) => onChanged(val!) : null
          )
        ),
      ],
    );
  }
}