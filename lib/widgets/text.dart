import 'package:flutter/material.dart';
import 'package:schoolevents/constant/const.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontsize;
  final Color color;
  final String fontfamily;
  const CustomText(
      {super.key,
      required this.text,
      this.fontsize = 30.0,
      this.color = bluecolor,
      this.fontfamily = 'Poppins'});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontsize,
        color: color,
        fontFamily: fontfamily,
      ),
    );
  }
}
