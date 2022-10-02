import 'package:flutter/material.dart';
import 'package:mvvm_test/screens/login.dart';
import 'package:mvvm_test/screens/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Login(),
    );
  }
}
