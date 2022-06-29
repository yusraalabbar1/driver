import 'dart:convert';

import 'package:driver/controller/controllerDirver.dart';
import 'package:driver/model/json/driver/d_orderModel.dart';
import 'package:driver/utilits/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

OrderApi() async {
  controllerProduct controller = Get.put(controllerProduct());
  List<Map<dynamic, dynamic>> allOrder = [];
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request = http.Request(
      'GET',
      Uri.parse(
          'https://myexpress.aqdeveloper.tech/api/v1/delivery/my-orders?lang=ar'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  OrderModel c = OrderModel.fromJson(jsonDecode(res.body));
  if (response.statusCode == 200) {
    // print(await response.stream.bytesToString());
    if (c.status == true) {
      print(c.message);
      for (var i = 0; i < c.data!.length; i++) {
        allOrder.add(c.data![i].toJson());
      }
      print("=================allOrder====================");
      controller.SaveAllOrder(allOrder);
    } else {
      print(c.message);
    }
  } else {
    // print(response.reasonPhrase);
  }
}