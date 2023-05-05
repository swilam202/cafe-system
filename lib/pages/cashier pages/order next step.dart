import 'package:cafe/controllers/data%20controller.dart';
import 'package:cafe/controllers/order%20controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextStep extends StatefulWidget {
  @override
  State<NextStep> createState() => _NextStepState();
}

class _NextStepState extends State<NextStep> {
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
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CheckboxListTile(
            value: controller.cash,
            onChanged: (val) {
              controller.cash = val!;
              setState(() {});
            },
            title: const Text(
              'will he pay with cash ?',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              controller.order.setIsCash(controller.cash == true ? 1 : 0);

              print('code :  ${controller.order.getCode()}');
              print('amount :  ${controller.order.getAmount()}');
              print('total :  ${controller.order.getTotal()}');
              print('cash or visa :  ${controller.order.getIsCash()}');
              print('here or takeaway :  ${controller.order.getIsTakeAway()}');
              Navigator.of(context).pushNamed('addorder');

              Navigator.of(context).pushNamed('final');
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
