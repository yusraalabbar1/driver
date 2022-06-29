import 'package:driver/controller/controllerDirver.dart';
import 'package:driver/utilits/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class info extends StatefulWidget {
  info({Key? key}) : super(key: key);

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {
  controllerProduct controller = Get.put(controllerProduct());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.color2,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("العنوان: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'Almarai')),
                SizedBox(
                  width: 5,
                ),
                Text(controller.detailsOrder["user_address"],
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'Almarai')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("رقم الهاتف: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'Almarai')),
                SizedBox(
                  width: 5,
                ),
                Text(controller.detailsOrder["user_mobile"],
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'Almarai')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("رقم التوصيل: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'Almarai')),
                SizedBox(
                  width: 5,
                ),
                Text(controller.detailsOrder["code"],
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'Almarai')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("السعر: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'Almarai')),
                SizedBox(
                  width: 5,
                ),
                Text(controller.detailsOrder["total"].toString(),
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'Almarai')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("الملاحظات : ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'Almarai')),
                SizedBox(
                  width: 5,
                ),
                Text("قابل للكسر",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'Almarai')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
