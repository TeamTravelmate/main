import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main/UIs/themes/colors.dart';


class CustomTextField extends StatelessWidget {

  final TextEditingController controller;
  final String? hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.hintText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: GoogleFonts.getFont('Roboto', fontSize: 18),
      cursorColor: ColorsTravelMate.secundary,
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,

        ),
        hintText: hintText,
      ),
      validator: validator,
    );
  }
}