import 'package:flutter/material.dart';

import '../core/utility/color_constant.dart';

class CustomButtons {
  static final _sharedInstance = CustomButtons._internal();

  CustomButtons._internal();

  static CustomButtons getInstance() {
    return _sharedInstance;
  }


  Widget getButton(
      {required BuildContext context,
        required String text,
        required VoidCallback onTap,
        Color? buttonColor}) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 50,
          width: size.width * 0.95,
          decoration: BoxDecoration(
            // border: Border.all(width: 3, color: buttonColor),
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            shape: BoxShape.rectangle,
            color: buttonColor ?? ConstantColor.primaryColor,
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: ConstantColor.white),
            ),
          )),
    );
  }

}