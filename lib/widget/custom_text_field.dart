import 'package:flutter/material.dart';

import '../core/utility/color_constant.dart';

class CustomTextField{


static Widget getEditField(
{required TextEditingController controller,
required String hintName,
required String lableText,
 TextInputType textInput = TextInputType.text,
  int? maxLines = 1
// Function()? onChange
}) {
return Padding(
  padding: const EdgeInsets.all(10.0),
  child: TextFormField(
  controller: controller,
  maxLines: maxLines,
  keyboardType:textInput,
  autovalidateMode: AutovalidateMode.onUserInteraction,
  decoration: InputDecoration(
    border: const OutlineInputBorder(
      borderSide: BorderSide(color: ConstantColor.primaryColor),
    ),
    // prefixIcon: Icon(iconData),
    labelText: lableText,
    contentPadding: const EdgeInsets.symmetric(
      vertical: 16.0,
      horizontal: 16.0,
    ),
  ),
  validator: (value) {
  if (value == null || value.isEmpty) {
  return hintName;
  }
  return null;
  },
  // onChanged: (value) {
  // onChange!.call();
  // }
  ),
);
}
}