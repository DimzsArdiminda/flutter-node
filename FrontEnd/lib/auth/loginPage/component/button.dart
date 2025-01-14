import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onClick;

  const ButtonWidget({
    required this.title,
    required this.onClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        shadowColor: const Color.fromARGB(255, 148, 148, 148),
        minimumSize: Size(200, 50), // Adjust the width and height as needed
      ),
      onPressed: onClick,
      child: Text(title),
    );
  }
}
