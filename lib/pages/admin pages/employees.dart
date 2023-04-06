import 'package:cafe/controllers/data%20controller.dart';
import 'package:cafe/database/sqldb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/employees sheet.dart';

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
    dataController.getUsers('users');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: dataController.users.length,
          itemBuilder: (_, index) {
            return userListTile(
              dataController.users[index]['id'],
              dataController.users[index]['name'],
              dataController.users[index]['username'],
              dataController.users[index]['password'],
              dataController.users[index]['permissions'],
            );
          },
        ),
      ),
      floatingActionButton: fab(),
    );
  }
}
