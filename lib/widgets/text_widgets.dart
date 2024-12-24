import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final Color color;
  final double textSize;
  bool isTitle;
  int maxLine = 10;
  TextWidget(
      {super.key,
      required this.title,
      required this.color,
      required this.textSize,
      this.isTitle = false,
      this.maxLine = 10});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLine,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: textSize,
        fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
    );
  }
}
