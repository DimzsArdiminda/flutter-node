import 'package:crud_basic/auth/loginPage/components/button.dart';
import 'package:crud_basic/auth/loginPage/components/form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void sendDataLogin() {
    print("Email: ${emailController.text}");
    print("Password: ${passwordController.text}");
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


            // footer
            const SizedBox(
              height: 200.0,
              
              ),
              Text("Developed by ardiminda projek")
            ],
          ),
        ),
      ),
    );
  }
}
