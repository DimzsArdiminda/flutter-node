import 'package:flutter/material.dart';

class FormOrder extends StatelessWidget {
  final String textLabel;
  final TextEditingController namaMakanan;
  
  const FormOrder({
    super.key,
    required this.textLabel,
    required this.namaMakanan,
  });


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: namaMakanan,
      decoration: InputDecoration(
        // hintText: "Nama Makanan",
        labelText: "Nama Makanan",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}