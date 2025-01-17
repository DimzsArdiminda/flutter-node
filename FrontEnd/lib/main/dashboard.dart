import 'package:crud_basic/main/components/carousel.dart';
import 'package:crud_basic/main/components/home/home.dart';
import 'package:crud_basic/main/components/listViewdata.dart';
import 'package:crud_basic/main/components/order/order.dart';
import 'package:crud_basic/main/data/data.dart';
import 'package:crud_basic/settings/settings.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String getTimer() {
    if (DateTime.now().hour < 12) {
      return 'Good Morning';
    } else if (DateTime.now().hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  String getUserData() {
    return 'User';
  }

  Widget _buildBusinessPage() {
    return const Center(
      child: Text(
        "Business Page",
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _buildSchoolPage() {
    return const Center(
      child: Text(
        "School Page",
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Settings()),
            ),
          ),
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${getTimer()}, ${getUserData()} 👋",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Selamat datang di aplikasi QWERTY",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          MyWidget(),
          OrderPage(),
          _buildSchoolPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time_rounded),
              label: 'Order'),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
