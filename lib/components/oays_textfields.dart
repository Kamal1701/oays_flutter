import 'package:flutter/material.dart';
import 'package:oays/utils/helpers/color_constant.dart';

class OAYSCustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  const OAYSCustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 0.0,
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            // hintText: hintText,
            labelText: hintText,
            labelStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: hintTextColor)),
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}
