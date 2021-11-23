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
    this.helperText,
    this.hintText,
    this.textFieldStyle = AvicennaTextFieldStyle.filled
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
  final String? helperText;
  final String? hintText;
  final AvicennaTextFieldStyle textFieldStyle;

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
          height: 44,// 51.2,
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
            onEditingComplete: onEditingComplete,
            enabled: enabled,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            obscureText: obscureText,
            initialValue: initialValue,
            maxLength: maxLength,
            style: TextStyle(color: enabled ? AvicennaColors.black : AvicennaColors.thirdBlack),
            decoration: decoration ?? InputDecoration(
              contentPadding: EdgeInsets.only(left: 16, right: 16, bottom: 0, top: textFieldStyle == AvicennaTextFieldStyle.filled ? -4 : -5.6),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
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
                    contentPadding: EdgeInsets.only(left: 16, right: 16, bottom: 0, top: widget.textFieldStyle == AvicennaTextFieldStyle.filled ? -4 : -5.6),
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
              IconButton(
                padding: const EdgeInsets.only(right: 12),
                onPressed: _passwordIconChange,
                icon: Icon(_passwordState ? Icons.visibility_off : Icons.visibility, color: AvicennaColors.thirdBlack),
              )
            ],
          ),
        ),
      ],
    );
  }
}