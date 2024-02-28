import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../avicenna.dart';
import 'values.dart';

enum AvicennaTextFieldSize {
  small, medium
}

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
    this.fontSize,
    this.helperText,
    this.hintText,
    this.textFieldStyle = AvicennaTextFieldStyle.filled,
    this.controller,
    this.onTap,
    this.size = AvicennaTextFieldSize.medium,
    this.autofocus = false,
    this.autovalidateMode,
  }) : super(key: key);

  final String? title;
  final String? initialValue;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final Function()? onEditingComplete;
  final String? Function(String?)? validator;
  final bool obscureText;

  /// if using the decoration, please add this
  ///   contentPadding: EdgeInsets.only(left: 16, right: 16),
  ///   border: InputBorder.none
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final int? maxLength;

  /// Only in range of 1 to 3
  final int maxLines;
  final double? fontSize;
  final String? helperText;
  final String? hintText;
  final AvicennaTextFieldStyle textFieldStyle;
  final TextEditingController? controller;
  final Function()? onTap;
  final AvicennaTextFieldSize size;
  final bool autofocus;
  final AutovalidateMode? autovalidateMode;

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
          height: size == AvicennaTextFieldSize.medium ? maxLines == 1 ? 44 : maxLines == 2 ? 56 : maxLines > 2 ? 72 : 72 : 36,// 51.2,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
              // light
              ? enabled
              ? textFieldStyle == AvicennaTextFieldStyle.filled
                ? const Color(0xFFEEEFF0)
                : AvicennaColors.white
              : AvicennaColors.textFieldFillDisabled
              
              // dark
              : enabled
              ? textFieldStyle == AvicennaTextFieldStyle.filled
                ? const Color(0xFF2A2B2D)
                : AvicennaColors.black
              : AvicennaColors.black,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: textFieldStyle == AvicennaTextFieldStyle.filled
              ? null
              : Border.all(width: 1.6, color: AvicennaColors.textFieldBorder),
            // boxShadow: av.Props.boxShadowVerySoft
          ),
          child: TextFormField(
            onTap: onTap,
            controller: controller,
            onEditingComplete: onEditingComplete,
            enabled: enabled,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            obscureText: obscureText,
            initialValue: initialValue,
            maxLength: maxLength,
            maxLines: maxLines,
            autofocus: autofocus,
            autovalidateMode: autovalidateMode,
            style: TextStyle(fontSize: fontSize), // color: enabled ? AvicennaColors.black : AvicennaColors.black, 
            decoration: decoration ?? InputDecoration(
              contentPadding: size == AvicennaTextFieldSize.medium
                ? EdgeInsets.only(left: 16, right: 16, bottom: 0, top: textFieldStyle == AvicennaTextFieldStyle.filled ? -4 : -7.6)
                : EdgeInsets.only(left: 16, right: 16, bottom: 0, top: textFieldStyle == AvicennaTextFieldStyle.filled ? -12 : -15.6),
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
    this.onTap,
    required this.minusWidth,
    this.autofocus = false,
    this.controller
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
  final Function()? onTap;
  final double minusWidth;
  final bool autofocus;
  final TextEditingController? controller;

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
            color: Theme.of(context).brightness == Brightness.light
              // light
              ? widget.enabled
              ? widget.textFieldStyle == AvicennaTextFieldStyle.filled
                ? const Color(0xFFEEEFF0)
                : AvicennaColors.white
              : AvicennaColors.textFieldFillDisabled
              
              // dark
              : widget.enabled
              ? widget.textFieldStyle == AvicennaTextFieldStyle.filled
                ? const Color(0xFF2A2B2D)
                : AvicennaColors.black
              : AvicennaColors.black,
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
                width: MediaQuery.of(context).size.width - 102 - widget.minusWidth,
                child: TextFormField(
                  onTap: widget.onTap,
                  controller: widget.controller,
                  onEditingComplete: widget.onEditingComplete,
                  enabled: widget.enabled,
                  inputFormatters: widget.inputFormatters,
                  keyboardType: widget.keyboardType,
                  obscureText: _passwordState,
                  initialValue: widget.initialValue,
                  maxLength: widget.maxLength,
                  autofocus: widget.autofocus,
                  // style: TextStyle(color: widget.enabled ? AvicennaColors.black : AvicennaColors.black),
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
              const SizedBox(width: 4),
            ],
          ),
        ),
      ],
    );
  }
}

class AvicennaPasswordFieldV2 extends StatefulWidget {
  const AvicennaPasswordFieldV2({
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
    this.onTap,
    required this.minusWidth,
    this.autofocus = false,
    this.controller
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
  final Function()? onTap;
  final double minusWidth;
  final bool autofocus;
  final TextEditingController? controller;

  @override
  _AvicennaPasswordFieldV2State createState() => _AvicennaPasswordFieldV2State();
}

class _AvicennaPasswordFieldV2State extends State<AvicennaPasswordFieldV2> {
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
                  width: MediaQuery.of(context).size.width, // - 102 - widget.minusWidth,
                  child: TextFormField(
                    onTap: widget.onTap,
                    controller: widget.controller,
                    onEditingComplete: widget.onEditingComplete,
                    enabled: widget.enabled,
                    inputFormatters: widget.inputFormatters,
                    keyboardType: widget.keyboardType,
                    obscureText: _passwordState,
                    initialValue: widget.initialValue,
                    maxLength: widget.maxLength,
                    autofocus: widget.autofocus,
                    style: TextStyle(color: widget.enabled ? AvicennaColors.black : AvicennaColors.black),
                    decoration: widget.decoration ?? InputDecoration(
                      contentPadding: EdgeInsets.only(left: 16, right: 16, bottom: 0, top: widget.textFieldStyle == AvicennaTextFieldStyle.filled ? -4 : -7.6),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(width: 1.6, color: AvicennaColors.textFieldBorder)
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 12.0),
                        child: GestureDetector(
                          onTap: _passwordIconChange,
                          child: Icon(_passwordState ? Icons.visibility_off : Icons.visibility, color: AvicennaColors.thirdBlack),
                        ),
                      ),
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
              // const Spacer(),
              // IconButton(
              //   // padding: const EdgeInsets.only(right: 12),
              //   onPressed: _passwordIconChange,
              //   splashRadius: 10,
              //   icon: Icon(_passwordState ? Icons.visibility_off : Icons.visibility, color: AvicennaColors.thirdBlack),
              // ),
              // const SizedBox(width: 6),
            ],
          ),
        ),
      ],
    );
  }
}


// @TODO: allow clear text
class AvicennaTextFieldWithSuffix extends StatelessWidget {
  const AvicennaTextFieldWithSuffix({
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
    this.hintText,
    this.helperText,
    this.textFieldStyle = AvicennaTextFieldStyle.filled,
    required this.suffixIcon,
    this.onPressed,
    this.onFieldTap,
    required this.minusWidth,
    this.borderRadius = 8,
    this.controller,
    this.size = AvicennaTextFieldSize.medium,
    this.autofocus = false,
    this.autovalidateMode
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
  final String? hintText;
  final String? helperText;
  final AvicennaTextFieldStyle textFieldStyle;
  final Widget suffixIcon;
  final Function()? onPressed;
  final Function()? onFieldTap;
  final double minusWidth;
  final double borderRadius;
  final TextEditingController? controller;
  final AvicennaTextFieldSize size;
  final bool autofocus;
  final AutovalidateMode? autovalidateMode;

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
        title != null ? Text(title!, style: const TextStyle(
            color: AvicennaColors.thirdBlack,
            fontWeight: FontWeight.w400
        )) : const SizedBox(height: 0),
        SizedBox(height: title != null ? 8 : 0),
        Container(
          height: size == AvicennaTextFieldSize.medium ? 44 : 36,// 51.2,
          // padding: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
              // light
              ? enabled
              ? textFieldStyle == AvicennaTextFieldStyle.filled
                ? const Color(0xFFEEEFF0)
                : AvicennaColors.white
              : AvicennaColors.textFieldFillDisabled
              
              // dark
              : enabled
              ? textFieldStyle == AvicennaTextFieldStyle.filled
                ? const Color(0xFF2A2B2D)
                : AvicennaColors.black
              : AvicennaColors.black,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            border: textFieldStyle == AvicennaTextFieldStyle.filled
              ? null
              : Border.all(width: 1.6, color: AvicennaColors.textFieldBorder),
          ),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 102 - minusWidth, // -46
                child: TextFormField(
                  controller: controller,
                  onTap: onFieldTap,
                  onEditingComplete: onEditingComplete,
                  enabled: enabled,
                  inputFormatters: inputFormatters,
                  keyboardType: keyboardType,
                  initialValue: initialValue,
                  maxLength: maxLength,
                  // style: TextStyle(color: enabled ? AvicennaColors.black : AvicennaColors.black),
                  autofocus: autofocus,
                  autovalidateMode: autovalidateMode,
                  decoration: decoration ?? InputDecoration(
                    contentPadding: size == AvicennaTextFieldSize.medium
                        ? EdgeInsets.only(left: 16, right: 16, bottom: 0, top: textFieldStyle == AvicennaTextFieldStyle.filled ? -4 : -7.6)
                        : EdgeInsets.only(left: 16, right: 16, bottom: 0, top: textFieldStyle == AvicennaTextFieldStyle.filled ? -12 : -15.6),
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
              const Spacer(),
              // AvicennaPress(
              //   // padding: const EdgeInsets.only(bottom: 2),
              //   onTap: () {
              //     print('loko');
              //   },
              //   // splashRadius: 10,
              //   child: const Icon(CupertinoIcons.clear_circled_solid, size: 16, color: Colors.black38),
              // ),
              IconButton(
                padding: const EdgeInsets.only(bottom: 2),
                onPressed: onPressed,
                splashRadius: 10,
                icon: suffixIcon,
              ),
              const SizedBox(width: 4),
            ],
          ),
        ),
      ],
    );
  }
}
