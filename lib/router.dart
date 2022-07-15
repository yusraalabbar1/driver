import 'package:express/main.dart';
import 'package:express/thems.dart';
import 'package:express/view/drier_vendor/auth/driver/d_login.dart';
import 'package:express/view/drier_vendor/auth/vendor/v_login.dart';
import 'package:express/view/drier_vendor/pages/driver/chat_screen.dart';
import 'package:express/view/drier_vendor/pages/driver/details.dart';
import 'package:express/view/drier_vendor/pages/driver/home_page.dart';
import 'package:express/view/drier_vendor/pages/driver/info.dart';
import 'package:express/view/drier_vendor/pages/init_page.dart';
import 'package:express/view/drier_vendor/pages/vendor/chat_vendor.dart';
import 'package:express/view/drier_vendor/pages/vendor/details_order_vendor.dart';
import 'package:express/view/drier_vendor/pages/vendor/order_vendor.dart';
import 'package:express/view/drier_vendor/pages/welcom.dart';
import 'package:express/view/drier_vendor/pages/welcom_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //isLogin == true ? welcomHome() :
      home: isLogin == true ? welcomHome() : init(),
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
        "init": ((context) => init()),
      },
      locale: Locale('ar'),
    );
  }
}
