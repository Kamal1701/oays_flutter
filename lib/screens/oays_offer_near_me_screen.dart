import 'package:flutter/material.dart';
import 'package:oays/components/oays_offer_gridview_builder.dart';
import 'package:oays/utils/helpers/color_constant.dart';

class OAYSOffersNearMeScreen extends StatefulWidget {
  const OAYSOffersNearMeScreen({super.key});

  @override
  State<OAYSOffersNearMeScreen> createState() => _OAYSOffersNearMeScreenState();
}

class _OAYSOffersNearMeScreenState extends State<OAYSOffersNearMeScreen> {
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
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 5,
          crossAxisSpacing: 7,
          mainAxisSpacing: 7,
        ),
        itemCount: myProducts.length,
        itemBuilder: (context, index) {
          return OAYSOfferGridViewBuilder();
        },
      ),
    );
  }
}
