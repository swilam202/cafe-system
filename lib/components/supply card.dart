import 'package:cafe/models/supplier%20model.dart';
import 'package:flutter/material.dart';

Widget suppliersCard({
  required String name,
  required String email,
  required int phone,
}) {
  return Card(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Row(
            children: [
              const Icon(
                Icons.email,
                color: Colors.blue,
              ),
              Text(
                "   $email",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.phone,
                color: Colors.blue,
              ),
              Text(
                '   $phone',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
