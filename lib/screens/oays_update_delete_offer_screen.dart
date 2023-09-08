import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:oays/components/oays_textfields.dart';
import 'package:oays/utils/helpers/color_constant.dart';
import 'package:oays/utils/helpers/color_utils.dart';
import 'package:oays/utils/helpers/helper_widgets.dart';

class OAYSUpdateDeleteOfferScreen extends StatefulWidget {
  const OAYSUpdateDeleteOfferScreen({super.key});

  @override
  State<OAYSUpdateDeleteOfferScreen> createState() =>
      _OAYSUpdateDeleteOfferScreenState();
}

class _OAYSUpdateDeleteOfferScreenState
    extends State<OAYSUpdateDeleteOfferScreen> {
  final _offerProductNameController = TextEditingController();
  final _offerProductBrandController = TextEditingController();
  final _offerProductCategoryController = TextEditingController();
  final _offerProductSubCategoryController = TextEditingController();
  final _offerProductActualPriceController = TextEditingController();
  final _offerProductDiscountPriceController = TextEditingController();
  final _offerProductStartDateController = TextEditingController();
  final _offerProductEndDateController = TextEditingController();
  final _offerProductWeightController = TextEditingController();
  final _offerProductDiscountPercentController = TextEditingController();
  final _offerProductDescriptionController = TextEditingController();
  // final _offerProductNameController = TextEditingController();
  // final _offerProductNameController = TextEditingController();
  // final _offerProductNameController = TextEditingController();
  String _imagePath = '';
  bool _isChecked = false;
  bool _isGestureDisabled = false;
  DateTime _dateTime = DateTime.now();

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Offer"),
        backgroundColor: bgdDarkColor,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("edd38c"),
              hexStringToColor("edd38c"),
              hexStringToColor("edd38c"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              addVerticalSpace(20),
              GestureDetector(
                onTap: _isGestureDisabled
                    ? null
                    : () async {
                        _imagePath = await _selectImageFromGallery();
                        if (_imagePath != '') {
                          setState(() {
                            if (_isChecked) {
                              _isGestureDisabled = true;
                            }
                          });
                        }
                      },
                child: _imagePath == ''
                    ? Image.asset(
                        'assets/images/image_placeholder.png',
                        height: 200,
                        width: 200,
                        fit: BoxFit.fill,
                      )
                    : Image.file(
                        File(_imagePath),
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
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value!;
                          // print(_isChecked);
                          if (_isChecked) {
                            _imagePath = '';
                            _isGestureDisabled = true;
                          } else {
                            _isGestureDisabled = false;
                          }
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
                controller: _offerProductNameController,
                hintText: "product name",
                obscureText: false,
              ),
              addVerticalSpace(10),
              OAYSCustomTextField(
                controller: _offerProductBrandController,
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
                        controller: _offerProductCategoryController,
                        hintText: "category",
                        obscureText: false,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: OAYSCustomTextField(
                        controller: _offerProductSubCategoryController,
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
                        controller: _offerProductActualPriceController,
                        hintText: "actual price",
                        obscureText: false,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: OAYSCustomTextField(
                        controller: _offerProductDiscountPriceController,
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
                        controller: _offerProductStartDateController,
                        readOnly: true,
                        onTap: () async {
                          _showDatePicker();
                          if (_dateTime != null) {
                            _offerProductStartDateController.text =
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
                        controller: _offerProductEndDateController,
                        readOnly: true,
                        onTap: () async {
                          _showDatePicker();
                          if (_dateTime != null) {
                            _offerProductEndDateController.text =
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
                        controller: _offerProductWeightController,
                        hintText: "product weight",
                        obscureText: false,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: OAYSCustomTextField(
                        controller: _offerProductDiscountPercentController,
                        hintText: "discount %",
                        obscureText: false,
                      ),
                    ),
                  ),
                ],
              ),
              addVerticalSpace(10),
              TextField(
                controller: _offerProductDescriptionController,
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
                        onPressed: () {},
                        child: const Text("Update"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 30, 0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Delete"),
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
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (file != null) {
      return file.path;
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
