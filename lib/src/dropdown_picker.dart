import 'package:flutter/material.dart';
import 'values.dart' as av;

/// if using the decoration, please add this
///   contentPadding: EdgeInsets.only(left: 16, right: 16),
///   border: InputBorder.none
class DropDownPicker extends StatelessWidget {
  const DropDownPicker({
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
    this.textFieldStyle = av.TextFieldStyle.filled
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
  final av.TextFieldStyle textFieldStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(
          color: av.Colors.thirdBlack,
          fontWeight: FontWeight.w400
        )),
        const SizedBox(height: 8),
        Container(
          height: 44, // 51.2,
          decoration: BoxDecoration(
            color: enabled
                ? textFieldStyle == av.TextFieldStyle.filled ? av.Colors.textFieldFill : av.Colors.white
                : av.Colors.textFieldFillDisabled,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: textFieldStyle == av.TextFieldStyle.filled
                ? null
                : Border.all(width: 1.6, color: av.Colors.textFieldBorder),
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
                  top: textFieldStyle == av.TextFieldStyle.filled ? -4 : -5.6),
              errorStyle: const TextStyle(
                shadows: [
                  Shadow(color: av.Colors.danger, offset: Offset(-6, 18))
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