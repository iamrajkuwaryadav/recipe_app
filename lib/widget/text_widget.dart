
import 'dart:ui';

import 'package:flutter/material.dart';


class TextRegular extends StatelessWidget {
  const TextRegular({
    super.key,
    required this.title,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal
  });

  final String title;
  final double? fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      //overflow: TextOverflow.ellipsis,
      overflow: TextOverflow.visible,
      softWrap: true,
      textAlign: TextAlign.left,
      style: TextStyle(
        // color: AppTheme.primaryTextColor,
        fontSize:fontSize,
        fontWeight: fontWeight, // Allows the text to wrap automatically
      ),
    );
  }
}
