import 'package:driver/controller/controllerDirver.dart';
import 'package:driver/model/api/driver/d_orderApi.dart';
import 'package:driver/model/api/driver/d_updateOrderApi.dart';
import 'package:driver/utilits/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class details extends StatefulWidget {
  details({Key? key}) : super(key: key);

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  var stat = "";
  var notes = "";
  var c1, c2, c3, cc1, cc2, cc3;

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
            padding: const EdgeInsets.all(15.0),
            child: Text(
              " اختر حالة الطلب",
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Almarai'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 55,
                child: RaisedButton(
                  color: c1 == 1 ? MyColors.color1 : Colors.red,
                  elevation: 10,
                  splashColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(color: Colors.red, width: 2)),
                  onPressed: () {
                    // Navigator.of(context).pushNamed("info");
                    setState(() {
                      c1 = 1;
                      c2 = 0;
                      c3 = 0;
                    });
                    stat = "cancelled";
                    print(stat);
                  },
                  child: Text(
                    "ملغي",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'Almarai'),
                  ),
                ),
              ),
              Container(
                height: 55,
                child: RaisedButton(
                  color: c2 == 1 ? MyColors.color1 : Colors.orange,
                  elevation: 10,
                  splashColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(color: Colors.orange, width: 2)),
                  onPressed: () {
                    // Navigator.of(context).pushNamed("info");
                    setState(() {
                      c1 = 0;
                      c2 = 1;
                      c3 = 0;
                    });
                    stat = "pending";
                    print(stat);
                  },
                  child: Text(
                    "موجل",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'Almarai'),
                  ),
                ),
              ),
              Container(
                height: 55,
                child: RaisedButton(
                  color: c3 == 1 ? MyColors.color1 : Colors.green,
                  elevation: 10,
                  splashColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(color: Colors.green, width: 2)),
                  onPressed: () {
                    // Navigator.of(context).pushNamed("info");
                    setState(() {
                      c1 = 0;
                      c2 = 0;
                      c3 = 1;
                    });
                    stat = "completed";
                    print(stat);
                  },
                  child: Text(
                    "تم التسليم",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'Almarai'),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              " اختر اختصارات التبليغ",
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Almarai'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              circuler("مفصول", cc1 = 1),
              circuler("مغلق", cc2 = 1),
              circuler("لارد", cc3 = 1),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              circuler("تعديل قيمة", notes == "تعديل قيمة"),
              circuler("رفض وعدم دفع توصيل", notes == "رفض وعدم دفع توصيل"),
              circuler("رفض ودفع توصيل", notes == "رفض ودفع توصيل"),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            height: 55,
            margin: EdgeInsets.only(bottom: 10, right: 30, left: 30, top: 10),
            child: RaisedButton(
              color: MyColors.color2,
              elevation: 10,
              splashColor: MyColors.color1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: BorderSide(color: MyColors.color2, width: 2)),
              onPressed: () async {
                print("ontap");
                print(stat);
                print(notes);
                await UpdateOrderApi(
                    context, controller.detailsOrder["id"], stat, notes);
                await OrderApi();
              },
              child: Text(
                "التعديل على حالة واختصار الطلب",
                style: TextStyle(
                    fontSize: 15, color: Colors.white, fontFamily: 'Almarai'),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 55,
            margin: EdgeInsets.only(bottom: 10, right: 30, left: 30, top: 10),
            child: RaisedButton(
              color: MyColors.color2,
              elevation: 10,
              splashColor: MyColors.color1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: BorderSide(color: MyColors.color2, width: 2)),
              onPressed: () {
                print("ontap");
                Navigator.of(context).pushNamed("info");
              },
              child: Text(
                "تفاصيل الطلب",
                style: TextStyle(
                    fontSize: 15, color: Colors.white, fontFamily: 'Almarai'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "التحدث مع التاجر",
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Almarai'),
            ),
          ),
          Container(
            width: double.infinity,
            height: 55,
            margin: EdgeInsets.only(bottom: 10, right: 30, left: 30, top: 10),
            child: RaisedButton(
              color: MyColors.color2,
              elevation: 10,
              splashColor: MyColors.color1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: BorderSide(color: MyColors.color2, width: 2)),
              onPressed: () {
                print("ontap");
                Navigator.of(context).pushNamed("ChatScreen");
              },
              child: Text(
                "ابدأ المحادثة",
                style: TextStyle(
                    fontSize: 15, color: Colors.white, fontFamily: 'Almarai'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget circuler(text, ontap) {
    return InkWell(
      onTap: () {
        // ontap;
        notes = text;
        print(notes);
      },
      child: CircleAvatar(
        backgroundColor: Color.fromARGB(255, 45, 183, 198),
        radius: 45,
        child: Text(text,
            style: TextStyle(
                fontSize: 13, color: Colors.white, fontFamily: 'Almarai')),
      ),
    );
  }
}
