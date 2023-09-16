import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:oays/models/offer_product_model.dart';
import 'package:oays/services/database_services.dart';

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
      return 'Please fill the required details.';
    } else if (!isNoProductImageChecked.value && productImagePath.value == '') {
      return 'Please add offer product image.';
    } else {
      DateFormat dateFormat = DateFormat('dd-MM-yyyy');
      final startDate = dateFormat.parse(offerProductStartDateController.text);
      final endDate = dateFormat.parse(offerProductEndDateController.text);
      isProductSuccess.value = true;
      if (startDate.compareTo(endDate) <= 0) {
        if (isNoProductImageChecked.value) {
          productImageUrl.value = '';
        } else {
          final Reference storageReference =
              FirebaseStorage.instance.ref().child(
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
          clearScreen();
          return 'Offer Added Successfully.';
        } else {
          clearScreen();
          return status;
        }
      } else {
        return 'Offer end date should be greater than offer start date';
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
