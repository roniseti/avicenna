import 'package:flutter/material.dart';
import 'values.dart';

class AvicennaDropDownItem {
  const AvicennaDropDownItem({
    required this.value,
    required this.text,
    this.widget,
    this.selectedItemWidget,
  });

  final dynamic value;
  final String text;
  final Widget? widget;
  final Widget? selectedItemWidget;
}

/// if using the decoration, please add this
///   contentPadding: EdgeInsets.only(left: 16, right: 16),
///   border: InputBorder.none
class AvicennaDropDownPicker extends StatelessWidget {
  const AvicennaDropDownPicker({
    Key? key,
    required this.items,
    this.title,
    this.hint,
    this.initialValue,
    required this.onChanged,
    this.validator,
    this.obscureText = false,
    this.decoration,
    this.enabled = true,
    this.textFieldStyle = AvicennaTextFieldStyle.filled,
    this.isExpanded = true,
  }) : super(key: key);

  final List<AvicennaDropDownItem> items;
  final String? title;
  final Widget? hint;
  final dynamic initialValue;
  final Function(dynamic) onChanged;
  final String? Function(dynamic)? validator;
  final bool obscureText;

  /// if using the decoration, please add this
  ///   contentPadding: EdgeInsets.only(left: 16, right: 16),
  ///   border: InputBorder.none
  final InputDecoration? decoration;
  final bool enabled;
  final AvicennaTextFieldStyle textFieldStyle;
  final bool isExpanded; 

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) Text(title!, style: const TextStyle(
          color: AvicennaColors.thirdBlack,
          fontWeight: FontWeight.w400
        )),
        SizedBox(height: title != null ? 8 : 0),
        Container(
          height: 44, // 51.2,
          decoration: BoxDecoration(
            color: enabled
              ? textFieldStyle == AvicennaTextFieldStyle.filled ? AvicennaColors.textFieldFill : AvicennaColors.white
              : AvicennaColors.textFieldFillDisabled,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: textFieldStyle == AvicennaTextFieldStyle.filled
              ? null
              : Border.all(width: 1.6, color: AvicennaColors.textFieldBorder),
          ),
          child: DropdownButtonFormField<dynamic>(
            key: key,
            value: initialValue == '' ? null : initialValue,
            hint: hint,
            decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)
              ),
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 0,
                top: textFieldStyle == AvicennaTextFieldStyle.filled ? -4 : -5.6),
              errorStyle: const TextStyle(
                shadows: [
                  Shadow(color: AvicennaColors.danger, offset: Offset(-6, 18))
                ],
                color: Colors.transparent
              )
            ),
            isExpanded: isExpanded,
            selectedItemBuilder: (context) => items.map((AvicennaDropDownItem item) {
              return item.selectedItemWidget ?? Text(item.text, maxLines: 1, overflow: TextOverflow.ellipsis);
            }).toList(),
            items: items.map((AvicennaDropDownItem item) {
              return DropdownMenuItem<dynamic>(
                value: item.value,
                child: item.widget ?? Text(item.text)
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

class AvicennaDropDownWidgetItem {
  const AvicennaDropDownWidgetItem({
    required this.value,
    required this.widget,
  });

  final String value;
  final Widget widget;
}

/// if using the decoration, please add this
///   contentPadding: EdgeInsets.only(left: 16, right: 16),
///   border: InputBorder.none
class AvicennaDropDownWidgetPicker extends StatelessWidget {
  const AvicennaDropDownWidgetPicker({
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
    this.textFieldStyle = AvicennaTextFieldStyle.filled
  }) : super(key: key);

  final List<AvicennaDropDownWidgetItem> items;
  final String title;
  final Widget? hint;
  final String? initialValue;
  final Function(String) onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;

  /// if using the decoration, please add this
  ///   contentPadding: EdgeInsets.only(left: 16, right: 16),
  ///   border: InputBorder.none
  final InputDecoration? decoration;
  final bool enabled;
  final AvicennaTextFieldStyle textFieldStyle;

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
              ? textFieldStyle == AvicennaTextFieldStyle.filled ? AvicennaColors.textFieldFill : AvicennaColors.white
              : AvicennaColors.textFieldFillDisabled,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: textFieldStyle == AvicennaTextFieldStyle.filled
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
                top: textFieldStyle == AvicennaTextFieldStyle.filled ? -4 : -5.6),
              errorStyle: const TextStyle(
                shadows: [
                  Shadow(color: AvicennaColors.danger, offset: Offset(-6, 18))
                ],
                color: Colors.transparent
              )
            ),
            items: items.map((AvicennaDropDownWidgetItem item) {
              return DropdownMenuItem<String>(
                value: item.value,
                child: item.widget
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