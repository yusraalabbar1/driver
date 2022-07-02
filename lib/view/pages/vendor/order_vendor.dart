import 'package:driver/controller/controllerDirver.dart';
import 'package:driver/model/api/driver/d_detailsOrderApi.dart';
import 'package:driver/model/api/vendor/v_detailsApi.dart';
import 'package:driver/utilits/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class orderVendor extends StatefulWidget {
  orderVendor({Key? key}) : super(key: key);

  @override
  State<orderVendor> createState() => _orderVendorState();
}

class _orderVendorState extends State<orderVendor> {
  controllerProduct controller = Get.put(controllerProduct());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // OrderApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الطلبات"),
        backgroundColor: MyColors.color2,
      ),
      body: ListView.builder(
          itemCount: controller.allOrderVendor.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () async {
                // await detailsOrderApi(controller.allOrderVendor[index]["id"]);
                await detailsVendorOrderApi(
                    controller.allOrderVendor[index]["id"]);
                Navigator.of(context).pushNamed("detailsOrderVendor");
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 200, 236, 239),
                    border: Border.all(
                      color: Color.fromARGB(255, 117, 180, 187),
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                      trailing: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          image: controller.allOrderVendor[index]["status"] ==
                                  "completed"
                              ? DecorationImage(
                                  image: NetworkImage(
                                      "https://thumbs.dreamstime.com/b/truth-icon-flat-truth-symbol-isolated-white-background-flat-vector-truth-icon-168806304.jpg"),
                                  fit: BoxFit.cover,
                                )
                              : controller.allOrderVendor[index]["status"] ==
                                      "cancelled"
                                  ? DecorationImage(
                                      image: NetworkImage(
                                          "https://www.pngitem.com/pimgs/m/144-1441954_right-and-wrong-symbols-clipart-png-download-clear.png"),
                                      fit: BoxFit.cover,
                                    )
                                  : DecorationImage(
                                      image: NetworkImage(
                                          "https://cdn.pecsaustralia.com/wp-content/uploads/2019/11/27165821/US_prod_Wait-Card_01.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "رقم الهاتف",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                fontFamily: 'Almarai'),
                          ),
                          Text(
                            controller.allOrderVendor[index]["user_mobile"]
                                .toString(),
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 15,
                                fontFamily: 'Almarai'),
                          ),
                        ],
                      ),
                      title: Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              Text("المنطقة",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      fontFamily: 'Almarai')),
                              Text(
                                  controller.allOrderVendor[index]
                                      ["user_address"],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: 'Almarai'))
                            ],
                          )),
                          Expanded(
                              child: Column(
                            children: [
                              Text("السعر",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      fontFamily: 'Almarai')),
                              Text(
                                  "${controller.allOrderVendor[index]["total"]}\$",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: 'Almarai'))
                            ],
                          )),
                        ],
                      )),
                ),
              ),
            );
          }),
    );
  }
}
