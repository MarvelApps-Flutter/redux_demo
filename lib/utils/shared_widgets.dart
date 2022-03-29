import 'package:flutter/material.dart';

Widget buildSizedBoxWidget({double? definedHeight , double? definedWidth})
{
  return SizedBox(
    height: definedHeight,
    width: definedWidth,
  );
}