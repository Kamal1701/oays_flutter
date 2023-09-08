import 'package:flutter/material.dart';
import 'package:oays/components/oays_merchant_offer_gridview_builder.dart';
import 'package:oays/utils/helpers/color_constant.dart';

class OAYSMerchantViewOfferScreen extends StatefulWidget {
  const OAYSMerchantViewOfferScreen({super.key});

  @override
  State<OAYSMerchantViewOfferScreen> createState() =>
      _OAYSMerchantViewOfferScreenState();
}

class _OAYSMerchantViewOfferScreenState
    extends State<OAYSMerchantViewOfferScreen> {
  final List<Map> myProducts = List.generate(
    10,
    (index) => {"id": index, "name": "Product $index"},
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0),
      decoration: BoxDecoration(
        color: bgdDarkColor,
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 3.8 / 2,
        ),
        itemCount: myProducts.length,
        itemBuilder: (context, index) {
          return const OAYSMerchantOfferGridViewBuilder();
        },
      ),
    );
  }
}
