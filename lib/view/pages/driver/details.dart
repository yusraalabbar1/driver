import 'package:driver/utilits/colors.dart';
import 'package:flutter/material.dart';

class details extends StatefulWidget {
  details({Key? key}) : super(key: key);

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.color2,
      ),
      body: ListView(
        children: [
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
              "حالة الطلب",
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
                  color: Colors.red,
                  elevation: 10,
                  splashColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(color: Colors.red, width: 2)),
                  onPressed: () {
                    // Navigator.of(context).pushNamed("info");
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
                  color: Colors.orange,
                  elevation: 10,
                  splashColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(color: Colors.orange, width: 2)),
                  onPressed: () {
                    // Navigator.of(context).pushNamed("info");
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
                  color: Colors.green,
                  elevation: 10,
                  splashColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(color: Colors.green, width: 2)),
                  onPressed: () {
                    // Navigator.of(context).pushNamed("info");
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
              "اختصارات التبليغ",
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
              circuler("مفصول", "ontap"),
              circuler("مغلق", "ontap"),
              circuler("لارد", "ontap"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              circuler("تعديل قيمة", "ontap"),
              circuler("رفض وعدم دفع توصيل", "ontap"),
              circuler("رفض ودفع توصيل", "ontap"),
            ],
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
