import 'package:blogapp/pages/homepage.dart';
import 'package:blogapp/user/login.dart';
import 'package:blogapp/user/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'chatgpt/chatscreen.dart';
void main() {
  runApp(ProviderScope(
      child : const  MyApp()
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: loginpage(),
    );
  }
}
