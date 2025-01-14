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

  String sendDataLogin(String email, String password) {
    return "Email: $email, Password: $password";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 100.0),
              Row(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Silahkan login menggunakan \nakun yang sudah anda buat",
                  overflow: TextOverflow.clip,),
                ],
              ),
              SizedBox(height: 20.0),
              FormFieldWidget(
                label: 'Email Address',
                labelText: 'Email',
                name: 'email',
                controller: emailController,
              ),
              SizedBox(height: 20.0),
              FormFieldWidget(
                label: 'Password',
                labelText: 'Password',
                name: 'password',
                controller: passwordController,
              ),
              SizedBox(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ButtonWidget(
                    title: 'Login',
                    onClick: () => sendDataLogin(emailController.text, passwordController.text),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
