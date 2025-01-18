import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  final String label;
  final String labelText;
  final TextEditingController name;

  const FormFieldWidget({
    required this.label,
    required this.labelText,
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8.0),
        TextFormField(
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please enter some text';
            }
            return null;
          },
          controller: name,
          decoration: InputDecoration(
            hintText: 'Enter your $labelText',
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(13.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(13.0),
            ),
          ),
        ),
      ],
    );
  }
}
