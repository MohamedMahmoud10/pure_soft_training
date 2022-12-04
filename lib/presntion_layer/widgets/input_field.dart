import 'package:flutter/material.dart';

class InPutField extends StatelessWidget {
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Widget label;
  final String hintText;
  final FormFieldValidator validator;
  int? maxLines;
  InPutField(
      {Key? key,
      required this.keyboardType,
      required this.controller,
      required this.label,
      required this.hintText,
      required this.validator,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
      child: TextFormField(
        maxLines: maxLines,
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          label: label,
          hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
