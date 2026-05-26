import 'package:booking_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    this.hintText,
    this.inputType,
    this.onChanged,
    this.labelText,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.readOnly = false,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    Key? key,
  }) : super(key: key);

  final String? hintText;
  final String? labelText;
  final Function(String)? onChanged;
  final TextInputType? inputType;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator; // يستقبل الدالة الخاصة بالتحقق
  final bool readOnly;
  final VoidCallback? onTap;
  final Icon? prefixIcon;
  final Icon? suffixIcon;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.inputType,
      obscureText: widget.isPassword ? _obscureText : false,
      onChanged: widget.onChanged,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: AppColors.grey),
        filled: true,
        fillColor: AppColors.fill,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 2,
          ), // لو فيه خطأ يظهر أحمر
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 2,
          ), // التركيز مع الخطأ
          borderRadius: BorderRadius.circular(10),
        ),
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
      ),
    );
  }
}
