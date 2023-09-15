import 'package:get/get.dart';

class DatabaseServiceController extends GetxController {
  static DatabaseServiceController get instance => Get.find();
  final isLoading = true.obs;
}
