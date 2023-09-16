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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
                        ? (() => Get.snackbar(
                              'Info',
                              'To add image, please uncheck no product image.',
                              snackPosition: SnackPosition.BOTTOM,
                              colorText: Colors.black,
                              backgroundColor: boxFillColor,
                            ))
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
                  addVerticalSpace(15),
                  OAYSCustomTextField(
                    controller: controller.offerProductNameController,
                    hintText: "Product Name",
                    obscureText: false,
                  ),
                  addVerticalSpace(15),
                  OAYSCustomTextField(
                    controller: controller.offerProductBrandController,
                    hintText: "Brand Name",
                    obscureText: false,
                  ),
                  addVerticalSpace(15),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: OAYSCustomTextField(
                            controller:
                                controller.offerProductCategoryController,
                            hintText: "Category",
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
                            hintText: "Sub category",
                            obscureText: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpace(15),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: OAYSCustomTextField(
                            controller:
                                controller.offerProductActualPriceController,
                            hintText: "Actual Price",
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
                            hintText: "Discount Price",
                            obscureText: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpace(15),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: TextFormField(
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'Offer Start Date',
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: hintTextColor,
                              ),
                            ),
                            controller:
                                controller.offerProductStartDateController,
                            readOnly: true,
                            onTap: () async {
                              // _showDatePicker(context);
                              final startDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now()
                                    .subtract(const Duration(days: 0)),
                                lastDate: DateTime(2099),
                              );

                              controller.offerProductStartDateController.text =
                                  startDate == null
                                      ? ''
                                      : _getFormattedDate(startDate);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: TextFormField(
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'Offer End Date',
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: hintTextColor,
                              ),
                            ),
                            controller:
                                controller.offerProductEndDateController,
                            readOnly: true,
                            onTap: () async {
                              final endDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now()
                                    .subtract(const Duration(days: 0)),
                                lastDate: DateTime(2099),
                              );

                              controller.offerProductEndDateController.text =
                                  endDate == null
                                      ? ''
                                      : _getFormattedDate(endDate);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpace(15),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: OAYSCustomTextField(
                            controller: controller.offerProductWeightController,
                            hintText: "Weight",
                            obscureText: false,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: OAYSCustomTextField(
                            controller: controller
                                .offerProductDiscountPercentController,
                            hintText: "Discount %",
                            obscureText: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpace(15),
                  TextField(
                    controller: controller.offerProductDescriptionController,
                    decoration: InputDecoration(
                        hintText: 'Description',
                        labelText: 'Description',
                        labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: hintTextColor)),
                    style: const TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                  addVerticalSpace(25),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 15, 0),
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                controller.isProductSuccess.value = true;
                              });
                              controller.addProduct()?.then((value) {
                                Get.snackbar(
                                  'Info',
                                  value,
                                  snackPosition: SnackPosition.BOTTOM,
                                  colorText: Colors.black,
                                  backgroundColor: boxFillColor,
                                );
                                setState(() {
                                  controller.isProductSuccess.value = false;
                                  // controller.isNoProductImageChecked.value =
                                  //     false;
                                  if (value.contains('Successfully')) {
                                    print(value);
                                    controller.productImagePath.value = '';
                                    controller.isGestureTapDisabled.value =
                                        false;
                                    controller.isNoProductImageChecked.value =
                                        false;
                                  }
                                });
                              });
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
                                controller.isNoProductImageChecked.value =
                                    false;
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
        ),
        if (controller.isProductSuccess.value)
          const Opacity(
            opacity: 0.5,
            child: ModalBarrier(
              color: Colors.black,
              dismissible: false,
            ),
          ),
        if (controller.isProductSuccess.value)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ],
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

  // _showDatePicker(BuildContext context) async {
  //   // showDatePicker(
  //   //   context: context,
  //   //   initialDate: DateTime.now(),
  //   //   firstDate: DateTime(2023),
  //   //   lastDate: DateTime(2099),
  //   // ).then((value) {
  //   //   setState(() {
  //   //     _dateTime = value!;
  //   //   });
  //   // });
  //   final selectedDate = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2023),
  //     lastDate: DateTime(2099),
  //   );

  //   if (selectedDate != null) {
  //     setState(() {
  //       _dateTime = selectedDate;
  //     });
  //   }
  // }

  _getFormattedDate(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }
}
