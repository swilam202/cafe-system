import 'package:cafe/components/custom%20text%20field.dart';
import 'package:cafe/components/employees%20sheet.dart';
import 'package:cafe/components/supply%20card.dart';
import 'package:cafe/controllers/data%20controller.dart';
import 'package:cafe/database/sqldb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/sheet button.dart';
import '../../components/warning.dart';

class SuppliersPage extends StatefulWidget {
  @override
  State<SuppliersPage> createState() => _SuppliersPageState();
}

class _SuppliersPageState extends State<SuppliersPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataController.getUsers('suppliers');
  }

  DataController dataController = Get.put(DataController());

  SQLDB sqldb = SQLDB();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 234, 234, 1.0),
      appBar: AppBar(
        title: const Text('Contacts'),
        centerTitle: true,
      ),
      body: Obx(() => ListView.builder(
            itemCount: dataController.suppliers.length,
            itemBuilder: (_, index) {
              return suppliersCard(
                  name: dataController.suppliers[index]['name'],
                  email: dataController.suppliers[index]['email'],
                  phone: dataController.suppliers[index]['phone']);
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController nameController = TextEditingController();
          TextEditingController emailController = TextEditingController();
          TextEditingController phoneController = TextEditingController();

          Get.bottomSheet(
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                customTextField(
                  type: TextInputType.text,
                  label: 'Name',
                  hint: 'Supplier Name',
                  controller: nameController,
                ),
                customTextField(
                  type: TextInputType.emailAddress,
                  label: 'Email',
                  hint: 'Supplier Email',
                  controller: emailController,
                ),
                customTextField(
                  type: TextInputType.phone,
                  label: 'Phone',
                  hint: 'Phone Name',
                  controller: phoneController,
                ),
                sheetButton(
                  () {
                    if (nameController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        phoneController.text.isEmpty) {
                      warning(
                          title: 'Warning',
                          message: 'All fields mustn\'t be null');
                    } else {
                      dataController.addUser(
                        'suppliers',
                        {
                          'name': nameController.text,
                          'email': emailController.text,
                          'phone': phoneController.text,
                        },
                      );
                      Get.back();
                    }
                    dataController.getUsers('suppliers');
                  },
                  const Text('+ add'),
                ),
              ],
            ),
            backgroundColor: Colors.white,
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
