import 'package:cafe/pages/admin%20pages/users%20info.dart';
import 'package:flutter/material.dart';

import 'pages/admin pages/admin home page.dart';
import 'pages/loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'admin',
      routes: {
        'login':(context)=>LogIn(),
        'admin':(context)=>AdminHomePage(),
        'users':(context)=>UserInfo(),
      },
    );
  }
}
