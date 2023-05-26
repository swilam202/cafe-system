import 'package:cafe/controllers/order%20controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/custom text field.dart';
import '../../controllers/data controller.dart';

 OrderController controller = Get.put(OrderController());

class AddOrder extends StatefulWidget {
  @override
  State<AddOrder> createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
  DataController dataController = Get.put(DataController());

  TextEditingController codeController = TextEditingController();

  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.careTaker.saveState(controller.order);
  }

  @override
  Widget build(BuildContext context) {

var args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
          onPressed: () {

            controller.careTaker.restoreState(controller.order,0);

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
           Text(
            args['name'],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),

          customTextField(
            type: TextInputType.phone,
            label: 'amount',
            hint: 'amount of product',
            controller: amountController,
          ),
          ElevatedButton(
            onPressed: () {
              controller.order.setCode(args['code']);
              controller.order.setAmount(int.parse(amountController.text));
              controller.order.setTotal(int.parse(amountController.text) * int.parse(args['price'].toString()) );
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
