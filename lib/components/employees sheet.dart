import 'package:cafe/components/sheet%20button.dart';
import 'package:cafe/components/warning.dart';
import 'package:cafe/controllers/data%20controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user.dart';
import 'custom text field.dart';

TextEditingController nameController = TextEditingController();
TextEditingController userController = TextEditingController();
TextEditingController passController = TextEditingController();
TextEditingController permissionController = TextEditingController();

DataController dataController = Get.put(DataController());

Widget userListTile(

  String name,
  String user,
  String password,

) {
  return Card(
    elevation: 5,
    child: ListTile(
      title: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('name:   $name'),

              ],
            ),
            Text('username:   $user'),
            Text('password:   $password'),
          ],
        ),
      ),
    ),
  );
}


