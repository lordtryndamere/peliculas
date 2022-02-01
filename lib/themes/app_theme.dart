
import 'package:flutter/material.dart';
class AppTheme {
  static const Color primary = Colors.indigo;
  static final ThemeData lighTheme = ThemeData.light().copyWith(
          primaryColor: Colors.indigo[100],
          appBarTheme: const AppBarTheme(color: primary, elevation: 0),
  );
}