import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData dartTheme = ThemeData(
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 18, color: Colors.white)),
    scaffoldBackgroundColor: HexColor('333739'),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: Colors.grey,
        backgroundColor: HexColor('333739'),
        type: BottomNavigationBarType.fixed,
        elevation: 30,
        selectedItemColor: Colors.deepOrange),
    appBarTheme: AppBarTheme(
        titleTextStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        backgroundColor: HexColor('333739'),
        elevation: 0,
        iconTheme: IconThemeData(
          color: HexColor('333739'),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor('333739'),
            statusBarIconBrightness: Brightness.light)));
ThemeData light = ThemeData(
    textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 18, color: Colors.black)),
    canvasColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 30,
        selectedItemColor: Colors.deepOrange),
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark)));
