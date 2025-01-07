// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final String iconString;
  final int quaterTurns;
  final Color color;
  const IconContainer({
    super.key,
    required this.iconString, required this.quaterTurns, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: 45,
      width: 40,
      padding: const EdgeInsets.all(11),
      decoration:
          BoxDecoration(color: color, shape: BoxShape.circle),
      child: RotatedBox(
        quarterTurns: quaterTurns,
        child: Center(
            child: Image.asset(
          height: height * 0.2,
          iconString,
          // 'assets/icons/menu.png',
          color: Colors.white,
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
