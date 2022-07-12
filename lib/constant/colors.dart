import 'package:flutter/material.dart';

const Map<int, Color> colorMap = {
  50: Color.fromRGBO(0, 0, 0, .1),
  100: Color.fromRGBO(0, 0, 0, .2),
  200: Color.fromRGBO(0, 0, 0, .3),
  300: Color.fromRGBO(0, 0, 0, .4),
  400: Color.fromRGBO(0, 0, 0, .5),
  500: Color.fromRGBO(0, 0, 0, .6),
  600: Color.fromRGBO(0, 0, 0, .7),
  700: Color.fromRGBO(0, 0, 0, .8),
  800: Color.fromRGBO(0, 0, 0, .9),
  900: Color.fromRGBO(0, 0, 0, 1),
};

MaterialColor primarySwatch = const MaterialColor(0xff0079bf, colorMap);
MaterialColor primaryColor = Colors.blue;

Color backgroundColor = Colors.grey.shade50;
// Color backgroundColor = Colors.transparent;

/// Border Color
Color borderColor = Colors.grey.shade300;
Color dropDownFillColor = Colors.grey.shade100;
Color containerFillColor = Colors.grey.shade200;

/// TextFormField color
Color textFormField = const Color(0xFFF4F6FC);
