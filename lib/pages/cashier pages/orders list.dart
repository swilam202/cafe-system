import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/data controller.dart';

class OrderList extends StatefulWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}


class _OrderListState extends State<OrderList> {

  DataController controller = Get.put(DataController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getUsers('order');
  }

  @override
  Widget build(BuildContext context) {




    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        centerTitle: true,
      ),
      body: Obx(() => ListView.builder(
            itemCount: controller.order.length,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  alignment: Alignment.topLeft,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Id:        ' +
                            controller.order[index]['id'].toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'name:        ' +
                            controller.order[index]['code'].toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Amount:        ' +
                            controller.order[index]['amount'].toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'total:        ' +controller.order[index]['total'].toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
