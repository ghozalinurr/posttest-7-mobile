import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> CustomAlert(BuildContext context, String pesan) {
  return showDialog(
    context: context,
    builder: (builder) {
      return AlertDialog(
          title: const Text("Add"),
          content: Text(pesan),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("OK"),
            ),
          ]);
    },
  );
}
