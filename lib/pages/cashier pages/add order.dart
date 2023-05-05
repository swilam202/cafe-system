import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/employees sheet.dart';
import '../../components/products listTile.dart';
import '../../controllers/data controller.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  DataController controller = Get.put(DataController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getUsers('products');

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
            () => ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            return ProductListTile(
              controller.products[index]['id'],
              controller.products[index]['name'],
              controller.products[index]['price'],
              controller.products[index]['duration'],

            );
          },
        ),
      ),
    );
  }
}
