import 'package:driver/thems.dart';
import 'package:driver/view/auth/driver/d_login.dart';
import 'package:driver/view/auth/vendor/v_login.dart';
import 'package:driver/view/pages/driver/chat_screen.dart';
import 'package:driver/view/pages/driver/details.dart';
import 'package:driver/view/pages/driver/home_page.dart';
import 'package:driver/view/pages/driver/info.dart';
import 'package:driver/view/pages/vendor/chat_vendor.dart';
import 'package:driver/view/pages/vendor/details_order_vendor.dart';
import 'package:driver/view/pages/vendor/order_vendor.dart';
import 'package:driver/view/pages/welcom_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/pages/welcom.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //isLogin == true ? welcomHome() :
      home: welcom(),
      theme: CustomTheme.lightTheme,
      routes: {
        "welcom": ((context) => welcom()),
        "homePage": ((context) => homePage()),
        "details": ((context) => details()),
        "info": ((context) => info()),
        "ChatScreen": ((context) => ChatScreen()),
        "login": ((context) => login()),
        "welcomHome": ((context) => welcomHome()),
        "loginVendor": ((context) => loginVendor()),
        "orderVendor": ((context) => orderVendor()),
        "chatVendor": ((context) => chatVendor()),
        "detailsOrderVendor": ((context) => detailsOrderVendor()),
      },
      locale: Locale('ar'),
    );
  }
}
