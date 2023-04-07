import 'package:cafe/models/supplier%20model.dart';
import 'package:flutter/material.dart';

Widget suppliersCard({required Supplier supplier}){
  return Card(
    child: Wrap(
      children: [
        Text(supplier.name),
        Text(supplier.email),
        Text(supplier.phone.toString()),

      ],
    ),
  )
}