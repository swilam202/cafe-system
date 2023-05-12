import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/data controller.dart';
import '../../controllers/order controller.dart';

class FianlOrder extends StatefulWidget {

  @override
  State<FianlOrder> createState() => _FianlOrderState();
}

class _FianlOrderState extends State<FianlOrder> {
  OrderController controller = Get.put(OrderController());

  DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            controller.careTaker.restoreState(controller.order);
            print('code :  ${controller.order.getCode()}');
            print('amount :  ${controller.order.getAmount()}');
            print('total :  ${controller.order.getTotal()}');
            print('cash or visa :  ${controller.order.getIsCash()}');
            print('here or takeaway :  ${controller.order.getIsTakeAway()}');
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          CheckboxListTile(
            value: controller.takeAway,
            onChanged: (val) {controller.takeAway = val!;
            setState(() {
            });
            },
            title: const Text(
              'will he take the order away ?',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              controller.order.setIsTakeAway(controller.takeAway == true ? 1 : 0);
              dataController.addUser(
                'order',
                {
                  'code': controller.order.getCode(),
                  'amount': controller.order.getAmount(),
                  'total': controller.order.getTotal(),
                  'status': 'waiting',
                },

              );
              print('code :  ${controller.order.getCode()}');
              print('amount :  ${controller.order.getAmount()}');
              print('total :  ${controller.order.getTotal()}');
              print('cash or visa :  ${controller.order.getIsCash()}');
              print('here or takeaway :  ${controller.order.getIsTakeAway()}');
              print('cash or visa :  ${controller.order.getIsCash()}');
              print('here or takeaway :  ${controller.order.getIsTakeAway()}');
              dataController.getUsers('order');
              Navigator.of(context).pushNamed('admin');
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
              ),
            ),
            child: const Text('submit'),
          ),
        ],
      ),
    );
  }
}
