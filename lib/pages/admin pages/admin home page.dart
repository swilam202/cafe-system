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
      backgroundColor: const Color.fromRGBO(234, 234, 234, 1.0),
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
            const SizedBox(),
            const SizedBox(),
            gridButton(
                'Employees', () => Navigator.of(context).pushNamed('users')),
            gridButton('Suppliers',
                () => Navigator.of(context).pushNamed('suppliers')),
            gridButton('title', () {
              sqldb.initDatabase();
            }),
            gridButton('delete', () {
              sqldb.deletedatabase();
            }),
          ],
        ),
      ),
    );
  }
}
