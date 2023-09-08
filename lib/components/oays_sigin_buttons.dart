import 'package:flutter/material.dart';

class OAYSCustomElevatedButtons extends StatelessWidget {
  final Function onTap;
  final String buttonText;
  const OAYSCustomElevatedButtons({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        child: Text(
          buttonText,
          // style: const TextStyle(
          //   color: Colors.black,
          //   fontWeight: FontWeight.bold,
          //   fontSize: 16,
          // ),
        ),
      ),
    );
  }
}
