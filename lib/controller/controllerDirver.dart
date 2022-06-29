import 'package:get/get.dart';

class controllerProduct extends GetxController {
  var saveProfileaccessToken;
  List<Map<dynamic, dynamic>> allOrder = [];
  List<Map<dynamic, dynamic>> allOrderVendor = [];
  Map<dynamic, dynamic> detailsOrder = {};
  SaveProfileaccessToken(v) {
    saveProfileaccessToken = v;
    update();
  }

  SaveAllOrder(v) {
    allOrder = v;
    update();
  }

  SavedetailsOrder(v) {
    detailsOrder = v;
    update();
  }

  SaveAllOrderVendor(v) {
    allOrderVendor = v;
    update();
  }
}
