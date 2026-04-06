import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool readOnly;
  final int maxLines;
  final int minLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onTap,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
        ],

        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPassword ? _obscureText : false,
          readOnly: widget.readOnly,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          validator: widget.validator,
          onTap: widget.onTap,

          decoration: InputDecoration(
            hintText: widget.hint,

            prefixIcon: widget.prefixIcon,

            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : widget.suffixIcon,

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 14,
            ),

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1.5,
              ),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
