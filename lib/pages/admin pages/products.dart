import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/custom text field.dart';
import '../../components/employees sheet.dart';
import '../../components/products listTile.dart';
import '../../components/sheet button.dart';
import '../../components/warning.dart';
import '../../controllers/data controller.dart';

class Products extends StatefulWidget {

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  DataController dataController = Get.put(DataController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataController.getUsers('products');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(),
      body: Obx(
            () => ListView.builder(
          itemCount: dataController.products.length,
          itemBuilder: (_, index) {
            return ProductListTile(
              dataController.products[index]['id'],
              dataController.products[index]['name'],
              dataController.products[index]['price'],
              dataController.products[index]['duration'],

            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController nameController = TextEditingController();
          TextEditingController priceController = TextEditingController();
          TextEditingController durationController = TextEditingController();

          Get.bottomSheet(
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                customTextField(
                  type: TextInputType.text,
                  label: 'Name',
                  hint: 'product Name',
                  controller: nameController,
                ),
                customTextField(
                  type: TextInputType.phone,
                  label: 'price',
                  hint: 'product price',
                  controller: priceController,
                ),
                customTextField(
                  type: TextInputType.text,
                  label: 'duration',
                  hint: 'product duration',
                  controller: durationController,
                ),
                sheetButton(
                      () {
                    if (nameController.text.isEmpty ||
                        priceController.text.isEmpty ||
                        durationController.text.isEmpty) {
                      warning(
                          title: 'Warning',
                          message: 'All fields mustn\'t be null');
                    } else {
                      dataController.addUser(
                        'products',
                        {
                          'name': nameController.text,
                          'price': priceController.text,
                          'duration': durationController.text,
                        },
                      );
                      Get.back();
                    }
                    dataController.getUsers('products');
                  },
                  const Text('+ Add'),
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
