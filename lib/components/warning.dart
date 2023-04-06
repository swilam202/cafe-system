import 'package:get/get.dart';
import 'package:flutter/material.dart';

warning({required String title, required String message}) {
  Get.snackbar(
    title,
    message,
    icon: const Icon(
      Icons.warning,
      color: Colors.red,
    ),
    colorText: Colors.red,
    snackPosition: SnackPosition.BOTTOM,
  );
}
