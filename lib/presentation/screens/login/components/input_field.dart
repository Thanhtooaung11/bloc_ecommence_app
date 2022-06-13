import 'package:bloc_ecommence_app/utils/constant.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final void Function() onEditingComplete;
  final FocusNode focusNode;
  final TextEditingController controller;
  const InputField({
    Key? key,
    required this.hintText,
    required this.validator,
    required this.onEditingComplete,
    required this.focusNode,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        contentPadding: const EdgeInsets.all(25),
        border: outlineInputBorder,
        hintText: hintText,
      ),
      validator: validator,
      onEditingComplete: onEditingComplete,
    );
  }
}
