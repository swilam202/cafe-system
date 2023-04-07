import 'package:cafe/components/warning.dart';
import 'package:cafe/controllers/data%20controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom text field.dart';

TextEditingController nameController = TextEditingController();
TextEditingController userController = TextEditingController();
TextEditingController passController = TextEditingController();

DataController dataController = Get.put(DataController());

Widget userListTile(
  int id,
  String name,
  String user,
  String password,
  int permission,
) {
  return Card(
    child: ListTile(
      title: DefaultTextStyle(
        style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w400),
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
                              text: name,
                              label: 'name',
                              hint: 'Name of the employee',
                              controller: nameController),
                          customTextField(
                            text: user,
                            label: 'username',
                            hint: 'username of the employee',
                            controller: userController,
                          ),
                          customTextField(
                            text: password,
                            label: 'password',
                            hint: 'Password of the employee',
                            controller: passController,
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
                          ElevatedButton(
                            onPressed: () {
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
                                    'permissions': 4,
                                  },
                                  id,
                                );
                                Get.back();
                              }
                              dataController.getUsers('users');
                            },
                            child: const Text('Update'),
                          ),
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
                label: 'name',
                hint: 'Name of the employee',
                controller: nameController),
            customTextField(
                label: 'username',
                hint: 'username of the employee',
                controller: userController),
            customTextField(
                label: 'password',
                hint: 'Password of the employee',
                controller: passController),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
              ),
              onPressed: () {
                if (nameController.text.isEmpty ||
                    userController.text.isEmpty ||
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
                      'permissions': 4,
                    },
                  );
                  Get.back();
                }
                dataController.getUsers('users');
              },
              child: const Text('+ Add'),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      );
    },
    child: const Icon(Icons.add),
  );
}
