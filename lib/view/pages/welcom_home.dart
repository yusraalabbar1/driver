import 'dart:async';

import 'package:driver/controller/controllerDirver.dart';
import 'package:driver/model/api/driver/d_orderApi.dart';
import 'package:driver/model/api/vendor/v_orderApi.dart';
import 'package:driver/utilits/colors.dart';
import 'package:driver/view/pages/welcom.dart';
import 'package:driver/view/widget_style/style_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class welcomHome extends StatefulWidget {
  welcomHome({Key? key}) : super(key: key);

  @override
  State<welcomHome> createState() => _welcomHomeState();
}

class _welcomHomeState extends State<welcomHome>
    with AutomaticKeepAliveClientMixin {
  getInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    controllerProduct controller = Get.put(controllerProduct());
    if (sendMen == "driver") {
      controller.SaveProfileaccessToken(
          preferences.getString('accessTokenDriver'));
      await OrderApi();
    } else {
      controller.SaveProfileaccessToken(
          preferences.getString('accessTokenVendor'));
      await OrderApiVendor();
    }
  }

  Timer? searchOnStoppedTyping;
  _onChangeHandler() {
    const duration = Duration(
        milliseconds:
            3000); // set the duration that you want call pop() after that.
    if (searchOnStoppedTyping != null) {
      searchOnStoppedTyping?.cancel(); // clear timer
    }
    searchOnStoppedTyping = new Timer(duration, () => navigateHome());
  }

  navigateHome() {
    if (sendMen == "driver") {
      Navigator.of(context).pushReplacementNamed("homePage");
    } else {
      Navigator.of(context).pushReplacementNamed("orderVendor");
    }
  }

  @override
  void initState() {
    getInfo();
    _onChangeHandler();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // imageBackgroundContainer(),
          containerMaine(),
          Container(
            decoration: boxDecorationMain(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                wstContainer1(context),
                Container(
                  margin: const EdgeInsets.only(bottom: 40),
                  child: const Text(
                    "",
                    style: TextStyle(
                        fontSize: 12,
                        color: MyColors.color3,
                        fontFamily: 'Almarai'),
                  ),
                ),
                Center(
                    child: Image.asset(
                  "assets/images/loading2.gif",
                  width: 130,
                ))
              ],
            ) /* add child content here */,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                "جميع الحقوق محفوظة لدى التطبيق ",
                style: TextStyle(
                    fontSize: 13,
                    color: MyColors.color3,
                    fontFamily: 'Almarai'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
