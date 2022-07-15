import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:device_info/device_info.dart';
import 'package:express/controller/controllerDirver.dart';
import 'package:express/model/json/vendor/v_loginModel.dart';
import 'package:express/utilits/colors.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

VendorloginApi(context, mobile, pass) async {
  var identifier;
  final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
  try {
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      identifier = build.androidId; //UUID for Android

      print("*********androidId********");
      print(identifier);
      print("*********identifier********");
    } else if (Platform.isIOS) {
      var data = await deviceInfoPlugin.iosInfo;
      identifier = data.identifierForVendor; //UUID for iOS

      print("*********isIOS********");
      print(identifier);
      print("*********identifier********");
    }
  } on PlatformException {
    print('Failed to get platform version');
  }

  String? fcm_token = await FirebaseMessaging.instance.getToken();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  controllerProduct controller = Get.put(controllerProduct());
  var headers = {'Accept': 'application/json'};
  var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://myexpress.aqdeveloper.tech/api/v1/vendor/login?lang=ar'));
  request.fields.addAll({
    'mobile': mobile,
    'password': pass,
    'fcm_token': fcm_token.toString(),
    'device_type': identifier
  });

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  VendLoginModel c = VendLoginModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.code == "200") {
      print(c.message);
      ///////////////////////////////////////////////
      preferences.setString(
          "accessTokenVendor", c.data!.user!.accessToken.toString());
      controller.SaveProfileaccessToken(
          preferences.getString('accessTokenVendor'));

      preferences.setBool("islogin", true);
      ////////////////////////////////////////////////
      Navigator.of(context).pushReplacementNamed("welcomHome");
      ////////////////////////////////////////////////
    } else {
      print(c.message);
      AwesomeDialog(
              context: context,
              animType: AnimType.RIGHSLIDE,
              headerAnimationLoop: true,
              btnOkOnPress: () {},
              body: Text(c.message.toString(),
                  style: TextStyle(
                      color: MyColors.color2,
                      fontSize: 14,
                      fontFamily: 'Almarai')),
              dialogBackgroundColor: MyColors.color3,
              btnOkColor: MyColors.color1)
          .show();
    }
  } else {
    print(c.message);
    AwesomeDialog(
            context: context,
            animType: AnimType.RIGHSLIDE,
            headerAnimationLoop: true,
            btnOkOnPress: () {},
            body: Text(c.message.toString(),
                style: TextStyle(
                    color: MyColors.color2,
                    fontSize: 14,
                    fontFamily: 'Almarai')),
            dialogBackgroundColor: MyColors.color3,
            btnOkColor: MyColors.color1)
        .show();
  }
}
