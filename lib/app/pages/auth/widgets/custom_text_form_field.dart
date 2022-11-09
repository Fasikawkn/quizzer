import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.validator,
    this.isObscured = false,
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final String? Function(String? value)? validator;
  final bool? isObscured;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscuredText = false;
  @override
  void initState() {
    obscuredText = widget.isObscured ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).primaryColor,
      ),
      obscureText: obscuredText,
      decoration: InputDecoration(
          fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          filled: true,
          hintText: widget.hintText,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
          prefixIcon: Icon(
            widget.prefixIcon,
            color: Theme.of(context).primaryColor,
          ),
          suffixIcon: widget.isObscured!
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      obscuredText = !obscuredText;
                    });
                  },
                  icon: Icon(
                      obscuredText ? Icons.visibility : Icons.visibility_off,
                      color: Theme.of(context).primaryColor))
              : const SizedBox(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(
              30.r,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(
              30.r,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(
              30.r,
            ),
          ),
          hintStyle: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColor.withOpacity(0.5))),
    );
  }
}
