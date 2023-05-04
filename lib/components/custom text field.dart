import 'package:flutter/material.dart';

Widget customTextField({String? text, required String label, required String hint,required TextEditingController controller,required TextInputType type,}){
  controller.text = text ?? '';
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
    child: TextField(
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(25),
        hintText: hint,
        labelText: label,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );

}