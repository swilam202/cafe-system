import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/admin pages/admin home page.dart';
import 'pages/admin pages/employees.dart';
import 'pages/admin pages/products.dart';

import 'pages/admin pages/suppliers page.dart';
import 'pages/cashier pages/add order.dart';
import 'pages/cashier pages/cahier home page.dart';
import 'pages/cashier pages/create feedback.dart';
import 'pages/cashier pages/feedback list.dart';
import 'pages/cashier pages/order final step.dart';
import 'pages/cashier pages/order first step.dart';
import 'pages/cashier pages/order second step.dart';
import 'pages/cashier pages/orders list.dart';
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
      home: LogIn(),
      routes: {
        'login':(context)=>LogIn(),
        'admin':(context)=>AdminHomePage(),
        'users':(context)=>UserInfo(),
        'suppliers':(context)=>SuppliersPage(),
        'products':(context)=>Products(),
        'addorder':(context)=>AddOrder(),
        'next':(context)=>NextStep(),
        'final':(context)=>FianlOrder(),
        'cashier':(context)=>CashierHomePage(),
        'list':(context)=>OrderList(),
        'addfeed':(context)=>CreateFeedBack(),
        'feedlist':(context)=>FeedbackList()
      },
    );
  }
}
