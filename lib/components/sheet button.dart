import 'package:flutter/material.dart';

Widget sheetButton(Function() function, Widget icon) {
  return ElevatedButton(
    onPressed: function,
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      ),
    ),
    child: icon,
  );
}
