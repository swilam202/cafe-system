import 'package:cafe/controllers/order%20controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/custom text field.dart';
import '../../controllers/data controller.dart';

 OrderController controller = Get.put(OrderController());

class AddOrder extends StatelessWidget {
  DataController dataController = Get.put(DataController());
  TextEditingController codeController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {

            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Order data',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
          customTextField(
            type: TextInputType.phone,
            label: 'code',
            hint: 'code of the product',
            controller: codeController,
          ),
          customTextField(
            type: TextInputType.phone,
            label: 'amount',
            hint: 'amount of product',
            controller: amountController,
          ),
          ElevatedButton(
            onPressed: () {
              controller.order.setCode(int.parse(codeController.text));
              controller.order.setAmount(int.parse(amountController.text));
              controller.order.setTotal(int.parse(amountController.text) * 50);
              controller.careTaker.saveState(controller.order);
              print('code :  ${controller.order.getCode()}');
              print('amount :  ${controller.order.getAmount()}');
              print('total :  ${controller.order.getTotal()}');
              print('cash or visa :  ${controller.order.getIsCash()}');
              print('here or takeaway :  ${controller.order.getIsTakeAway()}');
              Navigator.of(context).pushNamed('next');
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
              ),
            ),
            child: const Text('Next step'),
          ),
        ],
      ),
    );
  }
}
