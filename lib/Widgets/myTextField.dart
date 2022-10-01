import 'package:flutter/material.dart';

class MYTextFields extends StatelessWidget {
  TextEditingController? controller;
  String? hint;
  bool isPassword;
  TextInputType? inputType;

  MYTextFields(
      {Key? key,
      this.hint,
      this.controller,
      this.inputType,
      required this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        style: const TextStyle(color: Colors.black),
        controller: controller,
        decoration: InputDecoration(
            focusColor: Colors.red,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green)),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            contentPadding: const EdgeInsets.all(10),
            hintStyle: TextStyle(color: Colors.grey[800]),
            hintText: hint,
            fillColor: Colors.transparent),
        obscureText: isPassword,
        keyboardType: inputType,
        cursorColor: Colors.green,
        showCursor: true,
      ),
    );
  }
}
