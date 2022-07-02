import 'package:get/get.dart';

class controllerProduct extends GetxController {
  var saveProfileaccessToken;
  List<Map<dynamic, dynamic>> allOrder = [];
  List<Map<dynamic, dynamic>> allOrderVendor = [];
  Map<dynamic, dynamic> detailsOrder = {};
  Map<dynamic, dynamic> detailsOrdervendor = {};
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

  SavedVendoretailsOrder(v) {
    detailsOrdervendor = v;
    update();
  }

  SaveAllOrderVendor(v) {
    allOrderVendor = v;
    update();
  }
}
