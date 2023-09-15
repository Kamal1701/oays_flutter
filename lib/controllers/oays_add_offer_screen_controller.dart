import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oays/models/offer_product_model.dart';
import 'package:oays/services/database_services.dart';
import 'package:oays/utils/helpers/color_constant.dart';

class OAYSAddOfferController extends GetxController {
  static OAYSAddOfferController get instance => Get.find();

  final isNoProductImageChecked = false.obs;
  final isGestureTapDisabled = false.obs;
  final productImagePath = ''.obs;
  final productImageUrl = ''.obs;
  final isProductSuccess = false.obs;
  late XFile? productImageFile;

  final offerProductNameController = TextEditingController();
  final offerProductBrandController = TextEditingController();
  final offerProductCategoryController = TextEditingController();
  final offerProductSubCategoryController = TextEditingController();
  final offerProductActualPriceController = TextEditingController();
  final offerProductDiscountPriceController = TextEditingController();
  final offerProductStartDateController = TextEditingController();
  final offerProductEndDateController = TextEditingController();
  final offerProductWeightController = TextEditingController();
  final offerProductDiscountPercentController = TextEditingController();
  final offerProductDescriptionController = TextEditingController();

  void setNoProductImage(bool? value) {
    isNoProductImageChecked.value = value!;
    // print(_isChecked);
    if (isNoProductImageChecked.value) {
      productImagePath.value = '';
      isGestureTapDisabled.value = true;
    } else {
      isGestureTapDisabled.value = false;
    }
  }

  Future<String>? addProduct() async {
    if (offerProductNameController.text.isEmpty ||
        offerProductBrandController.text.isEmpty ||
        offerProductCategoryController.text.isEmpty ||
        offerProductSubCategoryController.text.isEmpty ||
        offerProductActualPriceController.text.isEmpty ||
        offerProductDiscountPriceController.text.isEmpty ||
        offerProductDiscountPercentController.text.isEmpty ||
        offerProductStartDateController.text.isEmpty ||
        offerProductEndDateController.text.isEmpty ||
        offerProductWeightController.text.isEmpty ||
        offerProductDescriptionController.text.isEmpty) {
      // Get.snackbar(
      //   'Info',
      //   'Please fill the required details.',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: boxFillColor,
      //   colorText: Colors.black,
      // );
      return 'Please fill the required details.';
    } else {
      isProductSuccess.value = true;
      if (isNoProductImageChecked.value) {
        productImageUrl.value = '';
      } else {
        final Reference storageReference = FirebaseStorage.instance.ref().child(
              'productImages/${DateTime.now().millisecondsSinceEpoch.toString()}',
            );
        UploadTask uploadTask =
            storageReference.putFile(File(productImageFile!.path));
        await uploadTask.whenComplete(() async {
          productImageUrl.value = await storageReference.getDownloadURL();
        });
      }

      OfferProduct op = OfferProduct(
          productImageUrl.value,
          isNoProductImageChecked.value,
          offerProductNameController.text.trim(),
          offerProductBrandController.text.trim(),
          offerProductActualPriceController.text.trim(),
          offerProductDiscountPriceController.text.trim(),
          offerProductStartDateController.text,
          offerProductEndDateController.text,
          offerProductWeightController.text.trim(),
          offerProductDiscountPercentController.text.trim(),
          offerProductDescriptionController.text.trim());
      String? status = await DatabaseService().addOfferProduct(op: op);
      if (status == 'Success') {
        // Get.snackbar('Info', 'Offer Added Successfully.',
        //     snackPosition: SnackPosition.BOTTOM,
        //     colorText: Colors.black,
        //     backgroundColor: boxFillColor);
        clearScreen();
        return 'Offer Added Successfully...';
      } else {
        // Get.snackbar('Info', status,
        //     snackPosition: SnackPosition.BOTTOM,
        //     colorText: Colors.black,
        //     backgroundColor: boxFillColor);
        clearScreen();
        return status;
      }
    }
  }

  Future<void> cancelProduct() async {
    clearScreen();
  }

  void clearScreen() {
    // productImagePath.value = '';
    offerProductNameController.text = '';
    offerProductBrandController.text = '';
    offerProductCategoryController.text = '';
    offerProductSubCategoryController.text = '';
    offerProductActualPriceController.text = '';
    offerProductDiscountPriceController.text = '';
    offerProductDiscountPercentController.text = '';
    offerProductStartDateController.text = '';
    offerProductEndDateController.text = '';
    offerProductWeightController.text = '';
    offerProductDescriptionController.text = '';
  }
}
