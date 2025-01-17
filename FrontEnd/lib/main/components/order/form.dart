import 'package:flutter/material.dart';

class FormOrder extends StatelessWidget {
  final String textLabel;
  final TextEditingController namaMakanan;
  final String tipe;
  
  const FormOrder({
    super.key,
    required this.textLabel,
    required this.namaMakanan,
    required this.tipe,
  });


  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: tipe == 'number' ? TextInputType.number : TextInputType.text,
      controller: namaMakanan,
      decoration: InputDecoration(
        // hintText: "Nama Makanan",
        labelText: textLabel,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}