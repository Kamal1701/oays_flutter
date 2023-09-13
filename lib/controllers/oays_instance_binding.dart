import 'dart:ffi';

import 'package:get/get.dart';
import 'package:oays/controllers/oays_authentication_repositary.dart';

class OAYSInstanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OAYSAuthenticationServices>(() => OAYSAuthenticationServices());
  }
}
