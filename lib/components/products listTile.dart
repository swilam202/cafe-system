import 'package:flutter/material.dart';

Widget ProductListTile(
  int id,
  String name,
  int price,
  String duration,
    int code,)
{
  return Container(
    margin: const EdgeInsets.all(5),
    child: Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            ' $price \$',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          leading: Text(
            '$code      $name',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          trailing: Text(
            '${duration}:00 min',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    ),
  );
}
