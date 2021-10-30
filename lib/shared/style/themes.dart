import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: defaultColor ,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: defaultColor
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: defaultColor,
  ),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    actionsIconTheme: IconThemeData(
        color: Colors.black87,
    ) ,
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black87,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultColor,
      elevation: 50.0
  ),
  textTheme: TextTheme(
      bodyText1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black87
      ),
    subtitle1: TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.bold,

    )
  ),
);

ThemeData darkTheme =  ThemeData(
  primarySwatch: Colors.deepOrange ,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.deepOrange
  ),
  appBarTheme: AppBarTheme(
    actionsIconTheme: IconThemeData(
        color: Colors.white
    ) ,
    backgroundColor: Colors.black,
    titleSpacing: 20.0,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.deepOrange,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      backgroundColor:Colors.black,
      elevation: 30.0
  ),
  textTheme: TextTheme(
      bodyText1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white
      )
  ),
  scaffoldBackgroundColor: Colors.black,
);
