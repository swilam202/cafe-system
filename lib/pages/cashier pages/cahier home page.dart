import 'package:cafe/components/grid%20button.dart';
import 'package:cafe/database/sqldb.dart';
import 'package:cafe/pages/cashier%20pages/add%20order.dart';
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

  DataController dataController = Get.put(DataController());
  SQLDB sqldb = SQLDB();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sqldb.db;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Cashier Home Page'),
        centerTitle: true,
      ),
     body: GridView.count(
       crossAxisCount: 2,
       mainAxisSpacing: 20,
       crossAxisSpacing: 20,
       childAspectRatio: 1.5,
       children: [
         const SizedBox(),
         const SizedBox(),

         gridButton(
           'Add Order',
               () => Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CreateOrder())),
           Icons.add,
         ),

         gridButton(
           'Order List',
               () => Navigator.of(context).pushNamed('list'),
           Icons.production_quantity_limits,
         ),

         gridButton(
           'Add Feed',
               () => Navigator.of(context).pushNamed('addfeed'),
           Icons.add_comment,
         ),

       ],
     ),
    );
  }
}
