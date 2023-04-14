import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  final String label;
  final Widget? suffix;
  final EdgeInsets? margin;
  final double? borderRadius;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final Color? bgColor;
  final Color? borderColor;
  final Function(String txt)? customValidation;
  final TextInputType? textInputType;
  Field({
    required this.label,
    this.suffix,
    this.margin,
    this.borderRadius,
    this.borderColor,
    this.controller,
    this.bgColor,
    this.customValidation,
    this.textInputType = TextInputType.text,
    this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: bgColor ?? Col.lightColor,
      //   borderRadius: BorderRadius.circular(borderRadius ?? 12),
      // ),
      margin: margin ?? EdgeInsets.only(bottom: 22),
      child: Column(
        children: [
          TextFormField(

            onTap: onTap,
            keyboardType: textInputType,
            controller: controller,
            cursorColor: Color(0xFF37E2D5),
            validator: (value) {
              if (customValidation != null) return customValidation!(value!);
              return null;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 12),
                borderSide: BorderSide(
                  color: Color(0xFF37E2D5),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius??12),
                borderSide: BorderSide(
                  color: Color(0xFF37E2D5),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius??12),
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius??12),
                borderSide: BorderSide(
                  color: Color(0xFF37E2D5),
                ),
              ),
              disabledBorder : OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius??12),
                borderSide: BorderSide(
                  color:Color(0xFF37E2D5),
                ),
              ),
              filled: true,
              fillColor:Colors.white,
              hintText: label
            ),
          ),
        ],
      ),
    );
  }


}
