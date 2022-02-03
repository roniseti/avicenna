import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'values.dart';

/// if using the decoration, please add this
///   contentPadding: EdgeInsets.only(left: 16, right: 16),
///   border: InputBorder.none
class AvicennaTextField extends StatelessWidget {
  const AvicennaTextField({
    Key? key,
    this.title,
    this.initialValue,
    this.onChanged,
    this.onSaved,
    this.onEditingComplete,
    this.validator,
    this.obscureText = false,
    this.decoration,
    this.keyboardType,
    this.inputFormatters,
    this.enabled = true,
    this.maxLength,
    this.maxLines = 1,
    this.helperText,
    this.hintText,
    this.textFieldStyle = AvicennaTextFieldStyle.filled,
    this.controller,
  }) : super(key: key);

  final String? title;
  final String? initialValue;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final Function()? onEditingComplete;
  final String? Function(String?)? validator;
  final bool obscureText;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final int? maxLength;

  /// Only in range of 1 to 3
  final int maxLines;
  final String? helperText;
  final String? hintText;
  final AvicennaTextFieldStyle textFieldStyle;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null ? Text(title!, style: const TextStyle(
            color: AvicennaColors.thirdBlack,
            fontWeight: FontWeight.w400
        )) : const SizedBox(height: 0),
        SizedBox(height: title != null ? 8 : 0),
        Container(
          padding: EdgeInsets.only(top: maxLines == 1 ? 0 : maxLines == 2 ? 6 : maxLines > 2 ? 12 : 12),
          height: maxLines == 1 ? 44 : maxLines == 2 ? 56 : maxLines > 2 ? 72 : 72,// 51.2,
          decoration: BoxDecoration(
            color: enabled
                ? textFieldStyle == AvicennaTextFieldStyle.filled ? AvicennaColors.textFieldFill : AvicennaColors.white
                : AvicennaColors.textFieldFillDisabled,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: textFieldStyle == AvicennaTextFieldStyle.filled
                ? null
                : Border.all(width: 1.6, color: AvicennaColors.textFieldBorder),
            // boxShadow: av.Props.boxShadowVerySoft
          ),
          child: TextFormField(
            controller: controller,
            onEditingComplete: onEditingComplete,
            enabled: enabled,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            obscureText: obscureText,
            initialValue: initialValue,
            maxLength: maxLength,
            maxLines: maxLines,
            style: TextStyle(color: enabled ? AvicennaColors.black : AvicennaColors.thirdBlack),
            decoration: decoration ?? InputDecoration(
              contentPadding: EdgeInsets.only(left: 16, right: 16, bottom: 0, top: textFieldStyle == AvicennaTextFieldStyle.filled ? -4 : -7.6),
              border: InputBorder.none,
              errorStyle: const TextStyle(
                shadows: [
                  Shadow(color: AvicennaColors.danger, offset: Offset(-6, 18))
                ],
                color: Colors.transparent
              ),
              hintText: hintText,
              helperText: helperText,
              helperStyle: const TextStyle(
                shadows: [
                  Shadow(offset: Offset(0, 18))
                ],
                color: Colors.transparent
              ),
            ),
            validator: validator,
            onChanged: onChanged,
            onSaved: onSaved,
          )
        ),
      ],
    );
  }
}

class AvicennaPasswordField extends StatefulWidget {
  const AvicennaPasswordField({
    Key? key,
    required this.title,
    this.initialValue,
    this.onChanged,
    this.onSaved,
    this.onEditingComplete,
    this.validator,
    this.obscureText = false,
    this.decoration,
    this.keyboardType,
    this.inputFormatters,
    this.enabled = true,
    this.maxLength,
    this.helperText,
    this.textFieldStyle = AvicennaTextFieldStyle.filled,
  }) : super(key: key);

  final String title;
  final String? initialValue;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final Function()? onEditingComplete;
  final String? Function(String?)? validator;
  final bool obscureText;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final int? maxLength;
  final String? helperText;
  final AvicennaTextFieldStyle textFieldStyle;

  @override
  _AvicennaPasswordFieldState createState() => _AvicennaPasswordFieldState();
}

class _AvicennaPasswordFieldState extends State<AvicennaPasswordField> {
  bool _passwordState = true;

  void _passwordIconChange() {
    setState(() {
      _passwordState = !_passwordState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: const TextStyle(
            color: AvicennaColors.thirdBlack,
            fontWeight: FontWeight.w400
        )),
        const SizedBox(height: 8),
        Container(
          height: 44,//51.2,
          // padding: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: widget.enabled
                ? widget.textFieldStyle == AvicennaTextFieldStyle.filled ? AvicennaColors.textFieldFill : AvicennaColors.white
                : AvicennaColors.textFieldFillDisabled,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: widget.textFieldStyle == AvicennaTextFieldStyle.filled
                ? null
                : Border.all(width: 1.6, color: AvicennaColors.textFieldBorder),
            // boxShadow: av.Props.boxShadowVerySoft
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 102,
                child: TextFormField(
                  onEditingComplete: widget.onEditingComplete,
                  enabled: widget.enabled,
                  inputFormatters: widget.inputFormatters,
                  keyboardType: widget.keyboardType,
                  obscureText: _passwordState,
                  initialValue: widget.initialValue,
                  maxLength: widget.maxLength,
                  style: TextStyle(color: widget.enabled ? AvicennaColors.black : AvicennaColors.thirdBlack),
                  decoration: widget.decoration ?? InputDecoration(
                    contentPadding: EdgeInsets.only(left: 16, right: 16, bottom: 0, top: widget.textFieldStyle == AvicennaTextFieldStyle.filled ? -4 : -7.6),
                    border: InputBorder.none,
                    // suffixIcon: Padding(
                    //   padding: EdgeInsetsDirectional.only(end: 12.0),
                    //   child: GestureDetector(
                    //     onTap: _passwordIconChange,
                    //     child: Icon(_passwordState ? Icons.visibility_off : Icons.visibility, color: AvicennaColors.thirdBlack),
                    //   ),
                    // ),
                    errorStyle: const TextStyle(
                        shadows: [
                          Shadow(color: AvicennaColors.danger, offset: Offset(-6, 18))
                        ],
                        color: Colors.transparent
                    ),
                    helperText: widget.helperText,
                    helperStyle: const TextStyle(
                        shadows: [
                          Shadow(offset: Offset(0, 18))
                        ],
                        color: Colors.transparent
                    ),
                  ),
                  validator: widget.validator,
                  onChanged: widget.onChanged,
                  onSaved: widget.onSaved,
                )
              ),
              const Spacer(),
              IconButton(
                // padding: const EdgeInsets.only(right: 12),
                onPressed: _passwordIconChange,
                splashRadius: 10,
                icon: Icon(_passwordState ? Icons.visibility_off : Icons.visibility, color: AvicennaColors.thirdBlack),
              ),
              const SizedBox(width: 6),
            ],
          ),
        ),
      ],
    );
  }
}

class AvicennaTextFieldWithSuffix extends StatelessWidget {
  const AvicennaTextFieldWithSuffix({
    Key? key,
    required this.title,
    this.initialValue,
    this.onChanged,
    this.onSaved,
    this.onEditingComplete,
    this.validator,
    this.obscureText = false,
    this.decoration,
    this.keyboardType,
    this.inputFormatters,
    this.enabled = true,
    this.maxLength,
    this.helperText,
    this.textFieldStyle = AvicennaTextFieldStyle.filled,
    required this.suffixIcon,
    this.onPressed,
    required this.minusWidth,
  }) : super(key: key);

  final String title;
  final String? initialValue;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final Function()? onEditingComplete;
  final String? Function(String?)? validator;
  final bool obscureText;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final int? maxLength;
  final String? helperText;
  final AvicennaTextFieldStyle textFieldStyle;
  final Widget suffixIcon;
  final Function()? onPressed;
  final double minusWidth;

//   @override
//   _AvicennaTextFieldWithSuffixState createState() => _AvicennaTextFieldWithSuffixState();
// }
//
// class _AvicennaTextFieldWithSuffixState extends State<AvicennaTextFieldWithSuffix> {
//   bool _passwordState = true;
//
//   void _passwordIconChange() {
//     setState(() {
//       _passwordState = !_passwordState;
//     });
//   }

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
          height: 44,//51.2,
          // padding: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: enabled
                ? textFieldStyle == AvicennaTextFieldStyle.filled ? AvicennaColors.textFieldFill : AvicennaColors.white
                : AvicennaColors.textFieldFillDisabled,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: textFieldStyle == AvicennaTextFieldStyle.filled
                ? null
                : Border.all(width: 1.6, color: AvicennaColors.textFieldBorder),
          ),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 102 - minusWidth,
                child: TextFormField(
                  onEditingComplete: onEditingComplete,
                  enabled: enabled,
                  inputFormatters: inputFormatters,
                  keyboardType: keyboardType,
                  initialValue: initialValue,
                  maxLength: maxLength,
                  style: TextStyle(color: enabled ? AvicennaColors.black : AvicennaColors.thirdBlack),
                  decoration: decoration ?? InputDecoration(
                    contentPadding: EdgeInsets.only(left: 16, right: 16, bottom: 0, top: textFieldStyle == AvicennaTextFieldStyle.filled ? -4 : -7.6),
                    border: InputBorder.none,
                    errorStyle: const TextStyle(
                      shadows: [
                        Shadow(color: AvicennaColors.danger, offset: Offset(-6, 18))
                      ],
                      color: Colors.transparent
                    ),
                    helperText: helperText,
                    helperStyle: const TextStyle(
                      shadows: [
                        Shadow(offset: Offset(0, 18))
                      ],
                      color: Colors.transparent
                    ),
                  ),
                  validator: validator,
                  onChanged: onChanged,
                  onSaved: onSaved,
                )
              ),
              const Spacer(),
              IconButton(
                // padding: const EdgeInsets.only(right: 12),
                onPressed: onPressed,
                splashRadius: 10,
                icon: suffixIcon,
              ),
              const SizedBox(width: 6),
            ],
          ),
        ),
      ],
    );
  }
}
