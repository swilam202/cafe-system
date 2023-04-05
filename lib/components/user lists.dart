import 'package:flutter/material.dart';

Widget userListTile(
    String name,String user,String password,int permission,) {
  return ListTile(
    title:Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name),
        Text(user),
        Text(password),
        Text(permission.toString()),
        IconButton(icon: const Icon(Icons.mode,color: Colors.blue,),onPressed: (){
        },)
      ],
    )
  );
}
