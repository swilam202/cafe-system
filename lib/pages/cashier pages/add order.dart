import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/custom text field.dart';
import '../../components/employees sheet.dart';
import '../../components/products listTile.dart';
import '../../components/sheet button.dart';
import '../../components/warning.dart';
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
    controller.getUsers('order');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
          ()=>ListView.builder(
            itemCount: controller.order.length,
            itemBuilder: (context,index){
              return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Wrap(
                  direction: Axis.vertical,
                  children: [
                    Text(controller.order[index]['id'].toString(),style: const TextStyle(fontSize: 35,fontWeight: FontWeight.bold,),),
                    Text(controller.order[index]['code'].toString(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,),),

                  ],
                ),
              );
            },
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController codeController = TextEditingController();
          TextEditingController amountController = TextEditingController();


          Get.bottomSheet(
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                customTextField(
                  type: TextInputType.phone,
                  label: 'Code',
                  hint: 'product code',
                  controller: codeController,
                ),
                customTextField(
                  type: TextInputType.phone,
                  label: 'Amount',
                  hint: 'Order amount',
                  controller: amountController,
                ),

                sheetButton(
                      () {
                    if (codeController.text.isEmpty ||
                        amountController.text.isEmpty ) {
                      warning(
                          title: 'Warning',
                          message: 'All fields mustn\'t be null');
                    } else {
                      dataController.addUser(
                        'order',
                        {
                          'code': codeController.text ,
                          'amount': amountController.text,
                          'total': int.parse(amountController.text) * 50,
                          'status':'waiting'
                        },
                      );
                      Get.back();
                    }
                    dataController.getUsers('order');
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
