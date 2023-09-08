import 'package:flutter/material.dart';
import 'package:oays/screens/oays_product_detail_screen.dart';
import 'package:oays/utils/helpers/color_constant.dart';

class OAYSOfferGridViewBuilder extends StatefulWidget {
  const OAYSOfferGridViewBuilder({super.key});

  @override
  State<OAYSOfferGridViewBuilder> createState() =>
      _OAYSOfferGridViewBuilderState();
}

class _OAYSOfferGridViewBuilderState extends State<OAYSOfferGridViewBuilder> {
  // final List<Map> myProducts = List.generate(
  //   10,
  //   (index) => {"id": index, "name": "Product $index"},
  // );
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => OAYSOfferProductDetailScreen()),
          ),
        );
      },
      child: Container(
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
            color: boxFillColor, borderRadius: BorderRadius.circular(12)),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
            child: Image.asset(
              'assets/images/camera.png',
              height: 225,
              width: 200,
              fit: BoxFit.fill,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                  child: Text(
                    "Product Name Product Name ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5.0, 5.0, 0, 0),
                  child: Text(
                    "R 200",
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.red,
                      decorationThickness: 3,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5.0, 5.0, 0, 0),
                  child: Text("R 100",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5.0, 5.0, 0, 0),
                  child: Text("(100%)",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5.0, 5.0, 0, 0),
                  child: Text(
                    "Last Date ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5.0, 5.0, 0, 0),
                  child: Text("25-09-2023",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
