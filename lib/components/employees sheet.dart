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
  int id,
  String name,
  String user,
  String password,
  int permission,
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
                IconButton(
                  icon: const Icon(
                    Icons.mode,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    Get.bottomSheet(
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          customTextField(
                              type: TextInputType.text,
                              text: name,
                              label: 'name',
                              hint: 'Name of the employee',
                              controller: nameController),
                          customTextField(
                            type: TextInputType.text,
                            text: user,
                            label: 'username',
                            hint: 'username of the employee',
                            controller: userController,
                          ),
                          customTextField(
                            type: TextInputType.visiblePassword,
                            text: password,
                            label: 'password',
                            hint: 'Password of the employee',
                            controller: passController,
                          ),
                          customTextField(
                            type: TextInputType.phone,
                            text: permission.toString(),
                            label: 'permission',
                            hint: 'permission of the employee',
                            controller: permissionController,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  dataController.deleteUser('users', id);
                                  Get.back();
                                  dataController.getUsers('users');
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          sheetButton(() {
                            if (nameController.text.isEmpty ||
                                userController.text.isEmpty ||
                                passController.text.isEmpty) {
                              warning(
                                  title: 'Warning',
                                  message: 'All fields mustn\'t be null');
                            } else {
                              dataController.updateUser(
                                'users',
                                {
                                  'name': nameController.text,
                                  'username': userController.text,
                                  'password': passController.text,
                                  'permissions': permissionController.text,
                                },
                                id,
                              );
                              Get.back();
                            }
                            dataController.getUsers('users');
                          }, const Text('Update'))
                        ],
                      ),
                      backgroundColor: Colors.white,
                    );
                  },
                ),
              ],
            ),
            Text('username:   $user'),
            Text('password:   $password'),
            Text('permission:   $permission'),
          ],
        ),
      ),
    ),
  );
}

FloatingActionButton fab() {
  return FloatingActionButton(
    onPressed: () {
      Get.bottomSheet(
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            customTextField(
              type: TextInputType.text,
              label: 'name',
              hint: 'Name of the employee',
              controller: nameController,
            ),
            customTextField(
              type: TextInputType.text,
              label: 'username',
              hint: 'username of the employee',
              controller: userController,
            ),
            customTextField(
              type: TextInputType.visiblePassword,
              label: 'password',
              hint: 'Password of the employee',
              controller: passController,
            ),
            customTextField(
              type: TextInputType.phone,
              label: 'permissions',
              hint: 'permissions of the employee',
              controller: permissionController,
            ),
            sheetButton(
              () {
                if (nameController.text.isEmpty ||
                    userController.text.isEmpty ||
                    permissionController.text.isEmpty ||
                    passController.text.isEmpty) {
                  warning(
                      title: 'Warning', message: 'All fields mustn\'t be null');
                } else {
                  dataController.addUser(
                    'users',
                    {
                      'name': nameController.text,
                      'username': userController.text,
                      'password': passController.text,
                      'permissions': permissionController.text,
                    },
                  );
                  Get.back();
                }
                dataController.getUsers('users');
              },
              const Text('+ Add'),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      );
    },
    child: const Icon(Icons.add),
  );
}
