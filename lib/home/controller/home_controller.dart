import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/home_data_response.dart';

class HomeControler extends GetxController {
  RxList<Data> homeDataList = List<Data>.of([]).obs;
  Future<void> fetchAllData() async {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 20000)
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = const Color(0xFF152F4B)
      ..indicatorColor = Colors.white
      ..dismissOnTap = false
      ..textColor = Colors.white;
    EasyLoading.show();
    var request = http.Request('GET',
        Uri.parse('https://api.ezcredit.com.kw/api/admin/get_testimonials'));

    http.StreamedResponse response = await request.send();
    String res = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      homeDataList.value =
          (HomeDataResponse.fromJson(json.decode(res)).data ?? []).toList();
      EasyLoading.dismiss();
    } else {
      debugPrint(response.reasonPhrase);
      EasyLoading.dismiss();
      Get.snackbar('Error!', 'Sorry there is no data',
          messageText: const Text(
            'Sorry there is no data',
            style: TextStyle(color: Colors.black54, fontSize: 15),
          ),
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20));
    }
  }
}
