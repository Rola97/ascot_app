import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FormController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController msgController = TextEditingController();
  RxBool isValidForm = false.obs;
  Future<void> addForm() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('https://api.ezcredit.com.kw/api/sys/contact_us'));
    request.body = json.encode({
      "name": nameController.text,
      "contact": contactController.text,
      "msg": msgController.text
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      debugPrint(await response.stream.bytesToString());
      EasyLoading.dismiss();
      Get.snackbar('Success!', 'The form has been submitted successfully',
          messageText: const Text(
            'The form has been submitted successfully',
            style: TextStyle(color: Colors.black54, fontSize: 15),
          ),
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20));
    } else {
      debugPrint(response.reasonPhrase);
      Get.snackbar('Error!', 'Something went wrong',
          messageText: const Text(
            'Something went wrong',
            style: TextStyle(color: Colors.black54, fontSize: 15),
          ),
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20));
    }
  }

  void formValidation() {
    isValidForm.value = nameController.text.isNotEmpty &&
        contactController.text.isNotEmpty &&
        msgController.text.isNotEmpty;
  }
}
