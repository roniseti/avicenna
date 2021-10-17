import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'values.dart' as av;

enum TextFieldStyle {
  filled, border
}

/// if using the decoration, please add this
///   contentPadding: EdgeInsets.only(left: 16, right: 16),
///   border: InputBorder.none
class TextField extends StatelessWidget {
  const TextField({
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
    this.textFieldStyle = TextFieldStyle.filled
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
  final TextFieldStyle textFieldStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null ? Text(title!, style: const TextStyle(
            color: av.Colors.thirdBlack,
            fontWeight: FontWeight.w400
        )) : const SizedBox(height: 0),
        SizedBox(height: title != null ? 8 : 0),
        Container(
            height: 44,// 51.2,
            decoration: BoxDecoration(
              color: enabled
                  ? textFieldStyle == TextFieldStyle.filled ? av.Colors.textFieldFill : av.Colors.white
                  : av.Colors.textFieldFillDisabled,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: textFieldStyle == TextFieldStyle.filled
                  ? null
                  : Border.all(width: 1.6, color: av.Colors.textFieldBorder),
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
              style: TextStyle(color: enabled ? av.Colors.black : av.Colors.thirdBlack),
              decoration: decoration ?? InputDecoration(
                contentPadding: EdgeInsets.only(left: 16, right: 16, bottom: 0, top: textFieldStyle == TextFieldStyle.filled ? -4 : -5.6),
                border: InputBorder.none,
                errorStyle: const TextStyle(
                    shadows: [
                      Shadow(color: av.Colors.danger, offset: Offset(-6, 18))
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

class PasswordField extends StatefulWidget {
  const PasswordField({
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
    this.textFieldStyle = TextFieldStyle.filled,
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
  final TextFieldStyle textFieldStyle;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
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
            color: av.Colors.thirdBlack,
            fontWeight: FontWeight.w400
        )),
        const SizedBox(height: 8),
        Container(
          height: 44,//51.2,
          // padding: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: widget.enabled
                ? widget.textFieldStyle == TextFieldStyle.filled ? av.Colors.textFieldFill : av.Colors.white
                : av.Colors.textFieldFillDisabled,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: widget.textFieldStyle == TextFieldStyle.filled
                ? null
                : Border.all(width: 1.6, color: av.Colors.textFieldBorder),
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
                    style: TextStyle(color: widget.enabled ? av.Colors.black : av.Colors.thirdBlack),
                    decoration: widget.decoration ?? InputDecoration(
                      contentPadding: EdgeInsets.only(left: 16, right: 16, bottom: 0, top: widget.textFieldStyle == TextFieldStyle.filled ? -4 : -5.6),
                      border: InputBorder.none,
                      // suffixIcon: Padding(
                      //   padding: EdgeInsetsDirectional.only(end: 12.0),
                      //   child: GestureDetector(
                      //     onTap: _passwordIconChange,
                      //     child: Icon(_passwordState ? Icons.visibility_off : Icons.visibility, color: av.Colors.thirdBlack),
                      //   ),
                      // ),
                      errorStyle: const TextStyle(
                          shadows: [
                            Shadow(color: av.Colors.danger, offset: Offset(-6, 18))
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
                icon: Icon(_passwordState ? Icons.visibility_off : Icons.visibility, color: av.Colors.thirdBlack),
              )
            ],
          ),
        ),
      ],
    );
  }
}