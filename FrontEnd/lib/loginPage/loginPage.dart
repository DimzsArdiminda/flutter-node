// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                  children: [
                    Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                      ),
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                        ),
                      ),
                    ),
                  ],
                ),
              
              )
              // RaisedButton(
              //   child: Text('Login'),
              //   onPressed: () {},
              // ),
            ],
          ),
        ),
      ) ,
    );
  }
}