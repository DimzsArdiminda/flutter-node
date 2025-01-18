import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:crud_basic/main/dashboard.dart';

void checkStatusLogin() {
  // shared preferences
  final SharedPreferences cekLogin = SharedPreferences.getInstance() as SharedPreferences;
  var statusLogin = cekLogin.getBool('statusLogin');
  if (statusLogin == false) {
    runApp(const MaterialApp(
      // home: LoginPage(),
      home: Dashboard(),
      debugShowCheckedModeBanner: false,
    ));
  } else {
    runApp(const MaterialApp(
      // home: Dashboard(),
      debugShowCheckedModeBanner: false,
    ));
  }
}