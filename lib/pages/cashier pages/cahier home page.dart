import 'package:cafe/components/grid%20button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/employees sheet.dart';
import '../../components/products listTile.dart';
import '../../controllers/data controller.dart';

class CashierHomePage extends StatefulWidget {
  const CashierHomePage({Key? key}) : super(key: key);

  @override
  State<CashierHomePage> createState() => _CashierHomePageState();
}


class _CashierHomePageState extends State<CashierHomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('a7a'),
        centerTitle: true,
      ),
     body: Center(child: IconButton(onPressed: () => Navigator.of(context).pushNamed('products'),icon: Icon(Icons.add),))
    );
  }
}
