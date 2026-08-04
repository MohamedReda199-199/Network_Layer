import 'package:flutter/material.dart';

class CountryCodeField extends StatelessWidget {
  final TextEditingController controller;
  const CountryCodeField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelText: "Country Code",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
