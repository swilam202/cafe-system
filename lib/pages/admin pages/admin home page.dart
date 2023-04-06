import 'package:cafe/database/sqldb.dart';
import 'package:flutter/material.dart';
import '../../components/grid button.dart';

class AdminHomePage extends StatefulWidget {
  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
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
        title: const Text('Control Page'),
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.5,
          children: [
            SizedBox(),
            SizedBox(),
            gridButton('Employees',(){
              Navigator.of(context).pushNamed('users');
            }),
            gridButton('title',(){}),
            gridButton('title',(){}),
            gridButton('title',(){}),

          ],
        ),
      ),
    );
  }
}
