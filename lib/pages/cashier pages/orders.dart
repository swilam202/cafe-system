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
                child: Card(
                  child: Wrap(
                    direction: Axis.vertical,
                    children: [
                      Text(controller.order[index]['id'].toString(),style: const TextStyle(fontSize: 35,fontWeight: FontWeight.bold,),),
                      Text(controller.order[index]['code'].toString(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,),),
                      Text(controller.order[index]['amount'].toString(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,),),
                      Text(controller.order[index]['total'].toString(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,),),
                    ],
                  ),
                ),
              );
            },
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         Navigator.of(context).pushNamed('addorder');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
