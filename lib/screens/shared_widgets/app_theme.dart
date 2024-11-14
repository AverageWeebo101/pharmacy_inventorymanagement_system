import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color.fromRGBO(204, 229, 255, 1),
    scaffoldBackgroundColor: const Color.fromRGBO(255, 252, 245, 1),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(174, 198, 207, 1),
      foregroundColor: Colors.black87,
      elevation: 2,
    ),
    cardColor: const Color.fromRGBO(255, 247, 235, 1),
    iconTheme: const IconThemeData(color: Colors.lightBlueAccent),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black87),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black54),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color.fromRGBO(186, 218, 212, 1),
      textTheme: ButtonTextTheme.primary,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color.fromRGBO(102, 153, 153, 1),
    scaffoldBackgroundColor: const Color.fromRGBO(18, 18, 18, 1),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(174, 198, 207, 1),
      foregroundColor: Colors.white,
      elevation: 2,
    ),
    cardColor: const Color.fromARGB(255, 28, 34, 36),
    iconTheme: const IconThemeData(color: Colors.lightBlueAccent),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white70),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.white54),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color.fromRGBO(153, 178, 183, 1),
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
