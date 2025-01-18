import 'dart:convert'; // Untuk encode dan decode JSON
import 'package:crud_basic/auth/loginPage/components/button.dart';
import 'package:crud_basic/auth/loginPage/components/form.dart';
import 'package:crud_basic/main/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// Ganti dengan URL API login Anda
const String apiUrl = 'http://192.168.1.101:4000/login';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Fungsi untuk mengirimkan data login dan menangani respon
  Future<void> sendDataLogin() async {
    final email = emailController.text;
    final password = passwordController.text;

    // Validasi input
    if (email.isEmpty || password.isEmpty) {
      showErrorDialog('Email atau Password tidak boleh kosong!');
      return;
    }

    // Kirim request login
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'emailUser': email,
          'pass': password,
        }),
      );

      // Cek status code dari server
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        // Cek apakah login berhasil (sesuaikan dengan struktur response API Anda)
        if (responseData['status'] == 'success') {
          // Simpan status login dan token di SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setInt('login_status', 1);  // 1 berarti berhasil login
          prefs.setString('token', responseData['token']); // Menyimpan token jika diperlukan

          // Arahkan ke halaman utama setelah login berhasil
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Dashboard()));
          // Navigator.push(context, MaterialPageRoute(builder: (context) => const Dashboard()));
        } else {
          showErrorDialog(responseData['msg'] ?? 'Login gagal');
        }
      } else {
        showErrorDialog('Gagal menghubungi server: ${response.statusCode}');
      }
    } catch (e) {
      showErrorDialog('Error: $e');
    }
  }

  // Fungsi untuk menampilkan dialog error
  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
          child: Column(
            children: [
              const SizedBox(height: 100.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Halo, Selamat Datang 👋 ",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Silahkan login menggunakan \nakun yang sudah anda buat",
                    overflow: TextOverflow.clip,),
                ],
              ),
              const SizedBox(height: 50.0),
              FormFieldWidget(
                label: 'Email Address',
                labelText: 'Email',
                name : emailController,
              ),
              const SizedBox(height: 20.0),
              FormFieldWidget(
                label: 'Password',
                labelText: 'Password',
                name: passwordController,
              ),
              const SizedBox(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ButtonWidget(
                    title: 'Login',
                    onClick: () => sendDataLogin(),
                  ),
                ],
              ),
              const SizedBox(height: 200.0),
              Text("Developed by ardiminda projek")
            ],
          ),
        ),
      ),
    );
  }
}
