import 'package:cafe/components/custom%20text%20field.dart';
import 'package:cafe/controllers/data%20controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuppliersPage extends StatelessWidget {
  DataController dataController = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        centerTitle: true,
      ),
      body: Obx(
          ()=>ListView.builder(
            itemCount: dataController.suppliers.length,
            itemBuilder: (_,index){

            },
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          TextEditingController nameController = TextEditingController();
          TextEditingController emailController = TextEditingController();
          TextEditingController phoneController = TextEditingController();

          customTextField(text: '', label: 'Name', hint: 'Supplier Name', controller: nameController);
          customTextField(text: '', label: 'Email', hint: 'Supplier Email', controller: emailController);
          customTextField(text: '', label: 'Phone', hint: 'Phone Name', controller: phoneController);

        },
      ),
    );
  }
}
