import 'package:cafe/components/custom%20text%20field.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/data controller.dart';

class CreateFeedBack extends StatelessWidget {
  CreateFeedBack({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController feedController = TextEditingController();
  DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add feedback'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          customTextField(
            label: 'Name',
            hint: 'Customer name',
            controller: nameController,
            type: TextInputType.text,
          ),
          customTextField(
            label: 'Content',
            hint: 'Customer feedback',
            controller: feedController,
            type: TextInputType.text,
          ),
          ElevatedButton(
            onPressed: () {
              dataController.addUser(
                'feedback',
                {
                  'name': nameController.text,
                  'content': feedController.text,
                },
              );
              Navigator.of(context).pop();
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  horizontal: 70,
                  vertical: 18,
                ),
              ),
            ),
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
