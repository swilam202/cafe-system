
import 'package:cafe/components/warning.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/data controller.dart';
import 'admin pages/admin home page.dart';
import 'cashier pages/cahier home page.dart';

class LogIn extends StatefulWidget {

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  GlobalKey<FormState> key = GlobalKey();

  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  DataController dataController = Get.put(DataController());

  bool found = false;

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
              CheckboxListTile(value: dataController.isAdmin.value, onChanged: (val){
                setState(() {
                  dataController.isAdmin.value = val!;
                });
              },title: Text('Are you an Admin?'),),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'User Name',
                  labelText: 'Enter your user Id',
                  suffixIcon: Icon(Icons.person),
                ),
                keyboardType: TextInputType.text,
                // validator: (value){
                //   if(dataController.isAdmin.value == true){
                //     if (dataController.admin['username'] != value)
                //       return 'Password is incorrect';
                //     else
                //       return null;
                //   }
                //   else{
                //     for(int i in dataController.users){
                //       if(dataController.users[i]['username'] == value){
                //         password = dataController.users[i]['password'];
                //         break;
                //       }
                //     }
                //     if (dataController.users['password'] != value )
                //       return 'Password is incorrect';
                //     else
                //       return null;
                //   }
                // },
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
                // validator: (value) {
                //   if(dataController.isAdmin.value == true){
                //     if (dataController.admin['password'] != value)
                //       return 'Password is incorrect';
                //     else
                //       return null;
                //   }
                //     return null;
                // }
              ),

              ElevatedButton(onPressed: (){
                // if(key.currentState!.validate()){
                //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AdminHomePage()));
                // }
                // else
                //   return;

                if(dataController.isAdmin.value == true){
                  if(dataController.admin['username'] == emailController.text && dataController.admin['password'] == passController.text){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>AdminHomePage()));
                    found = true;
                  }
                  if(found== false)
                    warning(title: 'Warning', message: 'invalid Password or Email');


                }
                if(dataController.isAdmin.value == false){
                  for(int i = 0;i < dataController.users.length;i++){
                    if(dataController.users[i]['username'].toString() == emailController.text && dataController.users[i]['password'].toString() == passController.text){
                      found = true;
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>CashierHomePage()));
                    }
                  }
                  if(found== false)
                    warning(title: 'Warning', message: 'invalid Password or Email');
                }
              }, child: const Text('Log in'),),
            ],
          ),
        ),
      ),

    );
  }
}
