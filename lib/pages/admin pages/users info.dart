import 'package:cafe/components/user%20lists.dart';
import 'package:cafe/controllers/data%20controller.dart';
import 'package:cafe/database/sqldb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInfo extends StatefulWidget {
  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
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
        title: Text('Employees'),
        centerTitle: true,
        actions: [
          ElevatedButton(onPressed: ()=>sqldb.deletedatabase(), child: Text('delete')),
          ElevatedButton(onPressed: ()=>sqldb.initDatabase(), child: Text('init')),
          ElevatedButton(onPressed: ()=>dataController.addUser('users',  {
            'name': 'mahmoud',
            'username': 'hoda',
            'password': 'dhfoiaue',
            'permissions': 2
          }), child: Text('insert')),
        ],
      ),
      body: Obx(
        () => dataController.users.isEmpty ? Center(child: Text('nothing'),):
        ListView.builder(
          itemCount: dataController.users.length,
          itemBuilder: (_, index) {
            return userListTile(
              dataController.users[index]['name'],
              dataController.users[index]['user'],
              dataController.users[index]['password'],
              dataController.users[index]['permissions'],
            );
          },
        ),
      ),
    );
  }
}
