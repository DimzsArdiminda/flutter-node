import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crud_basic/auth/loginPage/loginPage.dart';
import 'package:crud_basic/main/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: logicLgin(),
      // home: LoginPage(),
    );
  }

  FutureBuilder<int> logicLgin() {
    return FutureBuilder<int>(
      future: checkStatusLogin(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Tampilkan loading selama SharedPreferences di-load
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Jika terjadi error
          return const Center(child: Text('Terjadi kesalahan'));
        } else {
          // Jika status login ditemukan
          var statusLogin = snapshot.data;
          if (statusLogin == 1) {
            // Jika status login 1, arahkan ke Dashboard
            return const Dashboard();
          } else {
            // Jika status login 0 atau tidak ada, arahkan ke halaman login
            return const LoginPage();
          }
        }
      },
    );
  }

  // Fungsi untuk mengecek status login dari SharedPreferences
  Future<int> checkStatusLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('login_status') ?? 0; // Default 0 jika tidak ada status
  }
}
