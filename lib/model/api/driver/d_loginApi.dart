import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:driver/controller/controllerDirver.dart';
import 'package:driver/model/json/driver/d_loginModel.dart';
import 'package:driver/utilits/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

loginApi(context, mobile, pass) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  controllerProduct controller = Get.put(controllerProduct());
  var headers = {'Accept': 'application/json'};
  var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://myexpress.aqdeveloper.tech/api/v1/delivery/login?lang=ar'));
  request.fields.addAll({
    'mobile': mobile,
    'password': pass,
    'fcm_token':
        'ecK0peukQAWaCTUv1k0NGe:APA91bEo5mfq9Vdrj5-PA5KPabn0cEhHQh0-SyVq-rU4fPR_NYwhWFfxrVdKUMEadJGkmVH-a9LVvhlkfkaEdRmJuFT_-5cCK4A96Wx6-p-PZWyhJPxkBfftCDYbqLbJNKUGjjjXrXAr',
    'device_type': 'android'
  });

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  LoginModel c = LoginModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.code == "200") {
      print(c.message);
      ///////////////////////////////////////////////
      // preferences.setString("name", c.data!.user!.name.toString());
      // controller.SaveProfileName(preferences.getString('name'));
      // preferences.setString("mobile", c.data!.user!.mobile.toString());
      // controller.SaveProfilemobile(preferences.getString('mobile'));
      // preferences.setString(
      //     "photoProfile", c.data!.user!.photoProfile.toString());
      // controller.SaveProfilephotoProfile(preferences.getString('photoProfile'));
      // preferences.setString("city", c.data!.user!.city.toString());
      // controller.SaveProfiledefaultAddress(preferences.getString('city'));
      // preferences.setString("area", c.data!.user!.area.toString());
      // controller.SaveProfiledefaultAddressarea(preferences.getString('area'));
      preferences.setString(
          "accessTokenDriver", c.data!.user!.accessToken.toString());
      controller.SaveProfileaccessToken(
          preferences.getString('accessTokenDriver'));

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
