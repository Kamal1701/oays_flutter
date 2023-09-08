import 'package:flutter/material.dart';
import 'package:oays/utils/helpers/color_constant.dart';
import 'package:oays/utils/helpers/color_utils.dart';
import 'package:oays/utils/helpers/helper_widgets.dart';

class OAYSOfferProductDetailScreen extends StatefulWidget {
  const OAYSOfferProductDetailScreen({super.key});

  @override
  State<OAYSOfferProductDetailScreen> createState() =>
      _OAYSOfferProductDetailScreenState();
}

class _OAYSOfferProductDetailScreenState
    extends State<OAYSOfferProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Offer Details"),
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
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Container(
              alignment: Alignment.topLeft,
              // decoration: BoxDecoration(
              //     color: boxFillColor, borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: SizedBox(
                            height: 200,
                            width: 180,
                            // color: Colors.red,
                            child: Image.asset(
                              'assets/images/camera.png',
                              height: 200,
                              width: 180,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addVerticalSpace(10),
                            const Row(
                              children: [
                                Text(
                                  "Product name",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            addVerticalSpace(10),
                            const Row(
                              children: [
                                Text(
                                  "Brand name",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            addVerticalSpace(10),
                            Row(
                              children: [
                                const Text(
                                  "100",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    decoration: TextDecoration.lineThrough,
                                    decorationThickness: 3,
                                    decorationColor: Colors.red,
                                  ),
                                ),
                                addHorizontalSpace(30),
                                const Text(
                                  "200",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                addHorizontalSpace(30),
                                const Text(
                                  "5.00%",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            addVerticalSpace(10),
                            const Row(
                              children: [
                                Text(
                                  "1 Kg",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            addVerticalSpace(10),
                            Row(
                              children: [
                                const Text(
                                  "Start Date",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                addHorizontalSpace(26),
                                const Text(
                                  "20-10-2023",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            addVerticalSpace(10),
                            Row(
                              children: [
                                const Text(
                                  "End Date",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                addHorizontalSpace(32),
                                const Text(
                                  "20-10-2023",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    addVerticalSpace(25),
                    const Text(
                      "Shop Details: ",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    addVerticalSpace(10),
                    const Text(
                      "Shop Name",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    addVerticalSpace(10),
                    const Text(
                      "Street Name",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    addVerticalSpace(10),
                    const Text(
                      "City",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    addVerticalSpace(10),
                    const Text(
                      "State",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    addVerticalSpace(10),
                    const Text(
                      "Pincode",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
