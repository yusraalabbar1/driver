import 'dart:convert';

import 'package:driver/controller/controllerDirver.dart';
import 'package:driver/model/json/driver/d_detailsOrderModel.dart';
import 'package:driver/model/json/driver/d_orderModel.dart';
import 'package:driver/utilits/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

detailsOrderApi(id) async {
  controllerProduct controller = Get.put(controllerProduct());
  Map<dynamic, dynamic> detailsOrder = {};
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request = http.Request(
      'GET',
      Uri.parse(
          'https://myexpress.aqdeveloper.tech/api/v1/delivery/order-details/$id?lang=ar'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  detailsOrderModel c = detailsOrderModel.fromJson(jsonDecode(res.body));
  if (response.statusCode == 200) {
    // print(await response.stream.bytesToString());

    if (c.status = true) {
      print(c.message);
      print(c.data!.toJson());
      controller.SavedetailsOrder(c.data!.toJson());
    } else {
      print(c.message);
    }
  } else {
    // print(response.reasonPhrase);
  }
}
