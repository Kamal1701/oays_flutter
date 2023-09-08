import 'package:flutter/material.dart';
import 'package:oays/screens/oays_update_delete_offer_screen.dart';
import 'package:oays/utils/helpers/color_constant.dart';
import 'package:oays/utils/helpers/helper_widgets.dart';

class OAYSMerchantOfferGridViewBuilder extends StatefulWidget {
  const OAYSMerchantOfferGridViewBuilder({super.key});

  @override
  State<OAYSMerchantOfferGridViewBuilder> createState() =>
      _OAYSMerchantOfferGridViewBuilderState();
}

class _OAYSMerchantOfferGridViewBuilderState
    extends State<OAYSMerchantOfferGridViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const OAYSUpdateDeleteOfferScreen()),
          );
        },
        child: Container(
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
              color: boxFillColor, borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Column(
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
                        addVerticalSpace(20),
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
                            addHorizontalSpace(20),
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
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
