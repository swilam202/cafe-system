import 'package:cafe/components/order%20list%20tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/custom text field.dart';
import '../../components/employees sheet.dart';
import '../../components/products listTile.dart';
import '../../components/sheet button.dart';
import '../../components/warning.dart';
import '../../controllers/data controller.dart';

class CreateOrder extends StatefulWidget {
  const CreateOrder({Key? key}) : super(key: key);

  @override
  State<CreateOrder> createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
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
          ()=>ListView.builder(
            itemCount: dataController.products.length,
            itemBuilder: (context,index){
return orderListTile(
  context,
  dataController.products[index]['id'],
  dataController.products[index]['name'],
  dataController.products[index]['price'],
  dataController.products[index]['duration'],
  dataController.products[index]['code'],
);
            },
          )
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //    Navigator.of(context).pushNamed('addorder');
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}


// Obx(
// ()=>ListView.builder(
// itemCount: controller.order.length,
// itemBuilder: (context,index){
// return Container(
// alignment: Alignment.center,
// padding: const EdgeInsets.all(10),
// child: Card(
// child: Wrap(
// direction: Axis.vertical,
// children: [
// Text(controller.order[index]['id'].toString(),style: const TextStyle(fontSize: 35,fontWeight: FontWeight.bold,),),
// Text(controller.order[index]['code'].toString(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,),),
// Text(controller.order[index]['amount'].toString(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,),),
// Text(controller.order[index]['total'].toString(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,),),
// ],
// ),
// ),
// );
// },
// )
// ),


// Obx(
// ()=>ListView.builder(
// itemCount: controller.order.length,
// itemBuilder: (context,index){
// return Card(
// child: Container(
// width: MediaQuery.of(context).size.width,
// alignment: Alignment.topLeft,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Text('Id:    ' + controller.order[index]['id'].toString(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
// Text('Code: ' + controller.order[index]['code'].toString(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,),),
// Text(controller.order[index]['amount'].toString(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,),),
// Text(controller.order[index]['total'].toString(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,),),
// ],
// ),
// ),
// );
// },
// )
// ),