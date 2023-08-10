import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String text, text1;
  TextInputType type;
  IconData icon;
  TextEditingController control;
  CustomTextField(
      {super.key,
      required this.control,
      required this.text,
      required this.text1,
      required this.type,
      required this.icon});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: TextFormField(
        controller: control,
        keyboardType: type,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          prefixIcon: Icon(icon),
          label: Text(text1),
          hintText: text,
          hintStyle: const TextStyle(fontSize: 20),
        ),
        validator: (data) {
          if (data!.isEmpty) {
            return ("Invalid value");
          }
          return null;
        },
      ),
    );
  }
}
