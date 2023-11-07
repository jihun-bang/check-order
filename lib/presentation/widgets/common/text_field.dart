import 'package:check_order/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'empty_box.dart';

class CheckOrderTextField extends StatefulWidget {
  final String? label;
  final Color labelColor;
  final String? initText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final bool obscureText;
  final bool enabled;
  final double width;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;

  const CheckOrderTextField({
    super.key,
    this.label,
    this.labelColor = const Color(0xFF2B2B2B),
    this.initText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.obscureText = false,
    this.enabled = true,
    this.width = 448,
    this.onChanged,
    this.maxLines = 1,
    this.inputFormatters,
  });

  @override
  State<CheckOrderTextField> createState() => _CheckOrderTextFieldState();
}

class _CheckOrderTextFieldState extends State<CheckOrderTextField> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label?.isNotEmpty == true)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              widget.label!,
              style: TextStyle(
                color: widget.labelColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        SizedBox(
          width: widget.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: widget.maxLines == 1 ? 61 : null,
                child: TextField(
                  inputFormatters: widget.inputFormatters,
                  controller: widget.initText != null
                      ? (TextEditingController()
                        ..text = widget.initText!
                        ..selection = TextSelection.collapsed(
                            offset: widget.initText?.length ?? 0))
                      : null,
                  enabled: widget.enabled,
                  obscureText: widget.obscureText && !_showPassword,
                  obscuringCharacter: '*',
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.43,
                  ),
                  maxLines: widget.maxLines,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: widget.hintText,
                    hintStyle: const TextStyle(
                      color: Color(0xFF666687),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.43,
                    ),
                    suffixIcon: widget.obscureText
                        ? IconButton(
                            icon: Icon(
                              _showPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 16,
                            ),
                            onPressed: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                          )
                        : null,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          width: 0.50, color: Color(0xFFD5D5D5)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          width: 0.50, color: Color(0xFFD5D5D5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(width: 0.50, color: kSecondaryColor),
                    ),
                  ),
                  onChanged: widget.onChanged,
                ),
              ),
              if (widget.helperText != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    widget.helperText!,
                    style: const TextStyle(
                      color: Color(0xFF666687),
                      fontSize: 14,
                      height: 1.43,
                      letterSpacing: -0.15,
                    ),
                  ),
                ),
              if (widget.errorText != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.error_outline, color: Color(0xFFE00000)),
                      const EmptyBox(width: 8),
                      Text(
                        widget.errorText!,
                        style: const TextStyle(
                          color: Color(0xFFE00000),
                          fontSize: 14,
                          height: 1.43,
                          letterSpacing: -0.15,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
