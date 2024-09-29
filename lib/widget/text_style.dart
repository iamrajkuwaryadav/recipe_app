import 'package:flutter/material.dart';

import '../core/utility/color_constant.dart';



class AppTextStyles {


  static TextStyle heading2Style = const TextStyle(
    color: ConstantColor.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    // letterSpacing: 0.2,
    // fontStyle: FontStyle.normal,
    // fontFamily: "Montserrat",
  );

  static TextStyle subHeadingStyle = const TextStyle(
    color: ConstantColor.primaryColor,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    fontStyle: FontStyle.normal,
    // fontFamily: "Montserrat",
  );

  static TextStyle btnTextStyle = const TextStyle(
    color: ConstantColor.primaryColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.2,
    fontStyle: FontStyle.normal,
  );

  static TextStyle noScheduleTextStyle = const TextStyle(
    color: ConstantColor.primaryColor,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.2,
    fontStyle: FontStyle.normal,
    fontFamily: "Roboto",
  );


}
