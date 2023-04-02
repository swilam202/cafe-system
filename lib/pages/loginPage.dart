
import 'package:flutter/material.dart';

import '../controllers/data controller.dart';
import 'home page.dart';

class LogIn extends StatelessWidget {

  GlobalKey<FormState> key = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

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
                  if (DataController().users[0]['email'] != value)
                    return 'incorrect email';
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
                validator: (value){
                  if (DataController().users[0]['password'] != value)
                    return 'incorrect password';
                  else
                    return null;
                },
              ),

              ElevatedButton(onPressed: (){
                if(key.currentState!.validate()){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
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
