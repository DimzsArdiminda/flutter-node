import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              // shared preferences
              // final SharedPreferences cekLogin = SharedPreferences.getInstance() as SharedPreferences;
              // cekLogin.setBool('statusLogin', false);
              // checkStatusLogin();
            },
          ),
        ],
      ),
    );
  }
}