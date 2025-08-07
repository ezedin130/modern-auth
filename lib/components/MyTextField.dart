import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? Function(String?)? validator ;
  final controller;
  final String hintText;
  final bool obsecureText;
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obsecureText,
    required this.validator
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextFormField(
                validator: validator,
                controller: controller,
                obscureText: obsecureText,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  fillColor: Colors.grey,
                  hintText: hintText,
                ),
              ),
            );
  }
}