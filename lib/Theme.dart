import 'package:flutter/material.dart';
export './Theme.dart';
class MyTheme{

  static final lightTheme = ThemeData(

    buttonTheme: const ButtonThemeData(
      shape: Border(
        top: BorderSide(width: 10),
        bottom: BorderSide(width: 10),
        left: BorderSide(width: 10),
        right: BorderSide(width: 10),
      ),
    ),
    






  );

}