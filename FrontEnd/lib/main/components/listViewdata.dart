import 'package:crud_basic/main/components/button.dart';
import 'package:flutter/material.dart';

class ListViewProdukDashboard extends StatelessWidget {
  const ListViewProdukDashboard({
    super.key,
    required this.dataDummy,
  });

  final List<Map<String, dynamic>> dataDummy;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: dataDummy.length,
      itemBuilder: (context, index) {
        final menu = dataDummy[index];
        return Card(
          child: ButtonDashboardShowList(menu: menu),
        );
      },
    );
  }
}