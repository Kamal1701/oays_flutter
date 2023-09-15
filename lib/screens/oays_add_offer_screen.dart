import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:oays/components/oays_textfields.dart';
import 'package:oays/controllers/oays_add_offer_screen_controller.dart';
import 'package:oays/utils/helpers/color_constant.dart';
import 'package:oays/utils/helpers/color_utils.dart';
import 'package:oays/utils/helpers/helper_widgets.dart';

enum ImageSourceType { gallery, camera }

class OAYSAddOfferScreen extends StatefulWidget {
  const OAYSAddOfferScreen({super.key});

  @override
  State<OAYSAddOfferScreen> createState() => _OAYSAddOfferScreenState();
}

class _OAYSAddOfferScreenState extends State<OAYSAddOfferScreen> {
  final controller = Get.put(OAYSAddOfferController());

  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: boxFillColor,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            hexStringToColor("edd38c"),
            hexStringToColor("edd38c"),
            hexStringToColor("edd38c")
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              addVerticalSpace(20),
              GestureDetector(
                onTap: controller.isGestureTapDisabled.value
                    ? null
                    : () async {
                        controller.productImagePath.value =
                            await _selectImageFromGallery();
                        if (controller.productImagePath.value != '') {
                          setState(() {
                            if (controller.isNoProductImageChecked.value) {
                              controller.isGestureTapDisabled.value = true;
                            }
                          });
                        }
                      },
                child: controller.productImagePath.value == ''
                    ? Image.asset('assets/images/image_placeholder.png',
                        height: 200, width: 200, fit: BoxFit.fill)
                    : Image.file(
                        File(controller.productImagePath.value),
                        height: 200,
                        width: 200,
                        fit: BoxFit.fill,
                      ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.all(bgdDarkColor),
                      value: controller.isNoProductImageChecked.value,
                      onChanged: (value) {
                        setState(() {
                          controller.setNoProductImage(value);
                        });
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      "No product image",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              OAYSCustomTextField(
                controller: controller.offerProductNameController,
                hintText: "product name",
                obscureText: false,
              ),
              addVerticalSpace(10),
              OAYSCustomTextField(
                controller: controller.offerProductBrandController,
                hintText: "brand name",
                obscureText: false,
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: OAYSCustomTextField(
                        controller: controller.offerProductCategoryController,
                        hintText: "category",
                        obscureText: false,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: OAYSCustomTextField(
                        controller:
                            controller.offerProductSubCategoryController,
                        hintText: "sub category",
                        obscureText: false,
                      ),
                    ),
                  ),
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: OAYSCustomTextField(
                        controller:
                            controller.offerProductActualPriceController,
                        hintText: "actual price",
                        obscureText: false,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: OAYSCustomTextField(
                        controller:
                            controller.offerProductDiscountPriceController,
                        hintText: "discount price",
                        obscureText: false,
                      ),
                    ),
                  ),
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: TextFormField(
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'offer start date',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: hintTextColor,
                          ),
                        ),
                        controller: controller.offerProductStartDateController,
                        readOnly: true,
                        onTap: () async {
                          _showDatePicker();
                          if (_dateTime != null) {
                            controller.offerProductStartDateController.text =
                                _getFormattedDate(_dateTime);
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: TextFormField(
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'offer start date',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: hintTextColor,
                          ),
                        ),
                        controller: controller.offerProductEndDateController,
                        readOnly: true,
                        onTap: () async {
                          _showDatePicker();
                          if (_dateTime != null) {
                            controller.offerProductEndDateController.text =
                                _getFormattedDate(_dateTime);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: OAYSCustomTextField(
                        controller: controller.offerProductWeightController,
                        hintText: "product weight",
                        obscureText: false,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: OAYSCustomTextField(
                        controller:
                            controller.offerProductDiscountPercentController,
                        hintText: "discount %",
                        obscureText: false,
                      ),
                    ),
                  ),
                ],
              ),
              addVerticalSpace(10),
              TextField(
                controller: controller.offerProductDescriptionController,
                decoration: const InputDecoration(
                  // labelText: "product descrtion",
                  // floatingLabelAlignment: FloatingLabelAlignment.start,
                  hintText: "product description",
                ),
              ),
              addVerticalSpace(25),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 15, 0),
                      child: ElevatedButton(
                        onPressed: () async {
                          controller.addProduct();
                        },
                        child: const Text("Add"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 30, 0),
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            controller.isNoProductImageChecked.value = false;
                            controller.productImagePath.value = '';
                            controller.isGestureTapDisabled.value = false;
                          });
                          controller.cancelProduct();
                        },
                        child: const Text("Cancel"),
                      ),
                    ),
                  ),
                ],
              ),
              addVerticalSpace(50),
            ],
          ),
        ),
      ),
    );
  }

  _selectImageFromGallery() async {
    // XFile? file = await ImagePicker()
    //     .pickImage(source: ImageSource.gallery, imageQuality: 50);
    controller.productImageFile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (controller.productImageFile != null) {
      return controller.productImageFile?.path;
    } else {
      return '';
    }
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2099),
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  _getFormattedDate(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }
}
