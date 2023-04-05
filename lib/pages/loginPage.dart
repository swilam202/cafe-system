
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/data controller.dart';
import 'admin pages/admin home page.dart';

class LogIn extends StatelessWidget {

  GlobalKey<FormState> key = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'User Name',
                  labelText: 'Enter your userId',
                  suffixIcon: Icon(Icons.person),
                ),
                keyboardType: TextInputType.text,
                validator: (value){
                  if (dataController.users[1]['password'] != value)
                    return 'Password is incorrect';
                  else
                    return null;
                },
              ),
              TextFormField(
                controller: passController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  labelText: 'Enter your Password',
                  suffixIcon: Icon(Icons.visibility),
                ),
                obscureText: true,
                obscuringCharacter: '*',
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (dataController.users[1]['email'] != value)
                    return 'Email is incorrect';
                  else
                    return null;
                }
              ),

              ElevatedButton(onPressed: (){
                if(key.currentState!.validate()){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AdminHomePage()));
                }
                else
                  return;
              }, child: const Text('Log in'),),
            ],
          ),
        ),
      ),

    );
  }
}
