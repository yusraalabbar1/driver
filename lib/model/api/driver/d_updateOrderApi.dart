import 'dart:convert';

import 'package:driver/controller/controllerDirver.dart';
import 'package:driver/model/json/driver/d_orderModel.dart';
import 'package:driver/model/json/driver/d_updateOrderModel.dart';
import 'package:driver/utilits/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

OrderApi(id, status) async {
  controllerProduct controller = Get.put(controllerProduct());
  // List<Map<dynamic, dynamic>> allOrder = [];
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://myexpress.aqdeveloper.tech/api/v1/delivery/update-order/$id?lang=ar'));
  request.fields.addAll({'status': status});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  UpdateOrderModel c = UpdateOrderModel.fromJson(jsonDecode(res.body));
  if (response.statusCode == 200) {
    // print(await response.stream.bytesToString());
    if (c.status == true) {
      print(c.message);
    } else {
      print(c.message);
    }
  } else {
    // print(response.reasonPhrase);
  }
}
