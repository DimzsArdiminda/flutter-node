import 'package:flutter/material.dart';

class ButtonDashboardShowList extends StatelessWidget {
  const ButtonDashboardShowList({
    super.key,
    required this.menu,
  });

  final Map<String, dynamic> menu;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        // foregroundColor: Colors.black,
        // elevation: 2,
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        print("Anda memilih menu ${menu['Nama']}");
      },
      child: ListTile(
        leading: Image.asset(
          menu['path_image'],
          width: 100,
          height: 100,
        ),
        title: Text(menu['Nama'],
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text('Porsi: ${menu['porsi']}'),
        trailing: Text('Harga: ${menu['harga']}'),
      ),
    );
  }
}