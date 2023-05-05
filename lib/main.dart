import 'package:cafe/pages/cashier%20pages/add%20order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/admin pages/admin home page.dart';
import 'pages/admin pages/employees.dart';
import 'pages/admin pages/products.dart';
import 'pages/admin pages/suppliers page.dart';
import 'pages/cashier pages/cahier home page.dart';
import 'pages/cashier pages/final order step.dart';
import 'pages/cashier pages/order next step.dart';
import 'pages/cashier pages/orders.dart';
import 'pages/loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: AdminHomePage(),
      routes: {
        'login':(context)=>LogIn(),
        'admin':(context)=>AdminHomePage(),
        'users':(context)=>UserInfo(),
        'suppliers':(context)=>SuppliersPage(),
        'products':(context)=>Products(),
        'order': (context)=>Orders(),
        'addorder':(context)=>AddOrder(),
        'next':(context)=>NextStep(),
        'final':(context)=>FianlOrder()
      },
    );
  }
}
